import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/screens/home_screen.dart';
import 'package:flutter_project/features/auth/screens/search_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/auth/services/google_auth_service.dart';
import 'package:flutter_project/features/auth/widgets/custom_search_text.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:flutter_project/features/auth/widgets/top_home_btn.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  static const String routeName = '/notification-page';
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GoogleAuthService authService = GoogleAuthService();
  bool isTextFieldFocused = false;
  TextEditingController _searchController = TextEditingController();
  bool _isUp = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _toggleImage() {
    setState(() {
      _isUp = !_isUp;
    });
  }

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
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    'assets/images/notif_black.png',
                    height: 30,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Notification',
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                            child: Image.asset('assets/images/mail.png')),
                        Container(
                          margin: const EdgeInsets.fromLTRB(3, 20, 8, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You just reschedule for a book',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.6,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        constraints:
                                            const BoxConstraints(maxWidth: 240),
                                        child: Text(
                                          "Dear John Kirby,\n"
                                          "We're pleased to inform you that your hotel reservation has been successfully rescheduled. Here are the details of your updated booking:\n\n"
                                          "Reservation ID: [Reservation ID]\n"
                                          "Hotel Name: [Hotel Name]\n"
                                          "Original Check-in Date: [Original Check-in Date]\n"
                                          "New Check-in Date: [New Check-in Date]\n"
                                          "Original Check-out Date: [Original Check-out Date]\n"
                                          "New Check-out Date: [New Check-out Date]",
                                          style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.6,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        constraints:
                                            const BoxConstraints(maxWidth: 240),
                                        child: Text(
                                          "Booking ID 000000",
                                          style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.6,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  InkWell(
                                    onTap: _toggleImage,
                                    borderRadius: BorderRadius.circular(
                                        8), // Adjust the border radius as needed
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          8.0), // Adjust the padding as needed
                                      child: AnimatedSwitcher(
                                        duration: Duration(milliseconds: 300),
                                        child: _isUp
                                            ? Image.asset(
                                                'assets/images/arrow_up.png',
                                                height: 10,
                                                key: UniqueKey(),
                                              )
                                            : Image.asset(
                                                'assets/images/arrow_down.png',
                                                height: 10,
                                                key: UniqueKey(),
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '17 August 2023',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.6,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
