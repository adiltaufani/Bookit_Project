import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/features/auth/services/chat/message.dart';

class ChatService {
  //get instance of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverID, String message) async {
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderID: currentUserId,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    // Construct chat room ID for the two users
    List<String> ids = [currentUserId, receiverID];
    ids.sort();
    String chatRoomId = ids.join("-");

    // Add new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());

    // Update last message in the chat room
    await _firestore.collection('chat_rooms').doc(chatRoomId).set({
      'lastMessage': {
        'senderID': currentUserId,
        'senderEmail': currentUserEmail,
        'message': message,
        'timestamp': timestamp,
      },
    }, SetOptions(merge: true));
  }

  //get message
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    //construct a chatroom ID for 2 users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomId = ids.join("-");

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  //get last message
  Future<String?> getLastMessage(String chatRoomId) async {
    try {
      // Retrieve the last message in the chat room
      QuerySnapshot querySnapshot = await _firestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .orderBy("timestamp", descending: true)
          .limit(1)
          .get();

      // Check if there are any messages
      if (querySnapshot.docs.isNotEmpty) {
        // Extract the text from the last message
        String lastMessage = querySnapshot.docs.first.get("message");
        return lastMessage;
      } else {
        // No messages found
        return null;
      }
    } catch (error) {
      // Handle any errors
      print('Error getting last message: $error');
      return null;
    }
  }
}
