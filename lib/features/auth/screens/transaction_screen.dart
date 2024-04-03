import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/screens/home_screen.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/search_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/auth/services/google_auth_service.dart';
import 'package:flutter_project/features/auth/widgets/custom_search_text.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:flutter_project/features/auth/widgets/top_home_btn.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreen extends StatefulWidget {
  static const String routeName = '/transaction-screen';
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final GoogleAuthService authService = GoogleAuthService();
  bool isTextFieldFocused = false;
  TextEditingController _searchController = TextEditingController();
  bool _isUp = false;
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
                    'assets/images/transaction.png',
                    height: 30,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Transaction',
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
          ],
        ),
      ),
    );
  }
}
