import 'package:flutter/material.dart';
import 'package:flutter_project/features/message/screens/message_chat_screen.dart';
import 'package:flutter_project/features/auth/services/auth/firebase_auth_service.dart';
import 'package:flutter_project/features/auth/services/auth/google_auth_service.dart';
import 'package:flutter_project/features/message/services/chat_service.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:flutter_project/features/message/services/user_tile.dart';
import 'package:flutter_project/features/notification/screens/notification_page.dart';
import 'package:flutter_project/features/profile/screens/setting_page.dart';
import 'package:flutter_project/features/search/widgets/custom_search_text.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  static const String routeName = '/message-screen';
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final GoogleAuthService authService = GoogleAuthService();
  final FirebaseAuthService _authService = FirebaseAuthService();
  final ChatService _chatService = ChatService();
  bool isTextFieldFocused = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: SideMenu(),
        drawerScrimColor: Colors.black38,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            title: Container(
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: CustomSearchText(),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, NotificationPage.routeName);
                },
                icon: Image.asset(
                  'assets/images/notification.png',
                  height: 34.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SettingPage.routeName);
                },
                icon: Image.asset(
                  'assets/images/profile.png',
                  height: 38.0,
                ),
              ),
            ],
          ),
        ),
        body: _buildUserList());
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          //eror
          if (snapshot.hasError) {
            return const Text('error');
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading');
          }

          //return listview
          return Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFD2E9FF), // Warna gradient awal
                      Color(0xFFFFFFFF), // Warna gradient akhir
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/bookit.png',
                            height: 24,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 10, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/inbox.png',
                            height: 30,
                          ),
                          Text(
                            'Message',
                            style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: snapshot.data!
                          .map<Widget>((userData) =>
                              _buildUserListItem(userData, context))
                          .toList(),
                    ),
                  ],
                )),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    String senderUid = _authService.getCurrentUser()!.uid;
    //display all user
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        email: userData['email'],
        recieverUid: userData['uid'],
        senderUid: senderUid,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessageInboxScreen(
                receiverEmail: userData['email'],
                receiverID: userData['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
