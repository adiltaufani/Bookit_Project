import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/services/auth/google_auth_service.dart';
import 'package:flutter_project/features/chatAI/screens/aichat_page.dart';
import 'package:flutter_project/features/home/screens/home_screen.dart';
import 'package:flutter_project/features/landmark/screens/landmark_screen.dart';
import 'package:flutter_project/features/message/screens/message_screen.dart';
import 'package:flutter_project/features/notification/screens/notification_page.dart';
import 'package:flutter_project/features/payment/screens/transaction_screen.dart';
import 'package:flutter_project/features/profile/screens/setting_page.dart';
import 'package:flutter_project/features/wishlist/screens/wishlist_screen.dart';
import 'package:flutter_project/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SideMenu extends StatefulWidget {
  SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final GoogleAuthService authService = GoogleAuthService();

  String firstname = '';
  String lastname = '';
  String email = '';
  String pp = '';
  bool isDataAvail = false;

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A8ED9),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            isDataAvail
                ? ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, SettingPage.routeName);
                    },
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white30,
                      backgroundImage: NetworkImage(pp),
                    ),
                    title: Text(
                      firstname,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      email,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  )
                : ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, SettingPage.routeName);
                    },
                    leading: const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white30,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    title: Text(
                      '-------',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      '--------',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ),
            const Divider(
              color: Colors.white38,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.home_filled,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Home',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, LandmarkScreen.routeName);
                    },
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Landmark',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Colors.white24,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, WishlistScreen.routeName);
                    },
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.bookmark_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Wishlist',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, NotificationPage.routeName);
                    },
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.notifications_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Notification',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, TransactionScreen.routeName);
                    },
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.notes_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Transaction',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MessageScreen.routeName);
                    },
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.message_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Message',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Colors.white24,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, AIChatPage.routeName);
                    },
                    leading: SizedBox(
                      height: 36,
                      width: 36,
                      child: Image.asset(
                        'assets/images/chatai.png',
                        scale: 2.4,
                      ),
                    ),
                    title: Text(
                      'AI Support',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Colors.white24,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, SettingPage.routeName);
                    },
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.settings_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Setting',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.help_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Help',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      authService.signOut(context);
                    },
                    leading: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.login_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchUserData() async {
    var user = FirebaseAuth.instance.currentUser;

    // Pastikan user sudah login
    if (user == null) {
      // Jika user belum login, tampilkan pesan
      print("Silakan login terlebih dahulu");
      return; // Keluar dari metode fetchUserData
    }

    var url = Uri.parse("${ipaddr}/ta_projek/crudtaprojek/view_data.php");
    String uid = user.uid;
    var response = await http.post(url, body: {
      "uid": uid,
    });

    var data = json.decode(response.body);
    if (data != null) {
      // Data berhasil diterima, tampilkan firstname dan lastname
      firstname = data['firstname'];
      lastname = data['lastname'];
      email = data['email'];
      String cleanedUrlFoto = data['profile_picture'].replaceAll('\\', '');
      pp = await getImageUrl('images/image_$uid.jpg');
      print('Firstname: $firstname, Lastname: $lastname');
      // Lakukan apapun yang Anda ingin lakukan dengan data ini
      setState(() {
        isDataAvail = true;
      });
    } else {
      print("Gagal mendapatkan data pengguna");
    }
  }

  Future<String> getImageUrl(String imagePath) async {
    try {
      // Buat referensi Firebase Storage untuk gambar yang diunggah
      Reference ref = FirebaseStorage.instance.ref().child(imagePath);

      // Dapatkan URL download gambar
      String imageUrl = await ref.getDownloadURL();

      // Kembalikan URL download gambar
      return imageUrl;
    } catch (error) {
      // Tangkap error dan kembalikan URL gambar default jika terjadi kesalahan
      print("Error: $error");
      // Mengembalikan URL gambar default dari assets jika terjadi kesalahan
      return "https://firebasestorage.googleapis.com/v0/b/loginsignupta-prototype.appspot.com/o/images%2Fdefault.webp?alt=media&token=0f99eb8a-be98-4f26-99b7-d71776562de9";
    }
  }
}
