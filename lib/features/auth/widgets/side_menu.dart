import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/screens/auth_screen.dart';
import 'package:flutter_project/features/auth/screens/home_screen.dart';
import 'package:flutter_project/features/auth/screens/landmark_screen.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/auth/services/google_auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  SideMenu({super.key});

  final GoogleAuthService authService = GoogleAuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A8ED9),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, SettingPage.routeName);
              },
              leading: const CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white30,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              title: Text(
                'username',
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
                'email@example.com',
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
                    onTap: () {},
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
                    onTap: () {},
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
                    onTap: () {},
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
}
