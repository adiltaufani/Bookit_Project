import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/auth/widgets/custom_search_text.dart';
import 'package:flutter_project/features/auth/widgets/landmark_btn.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class LandmarkScreen extends StatefulWidget {
  static const String routeName = '/landmark-screen';
  const LandmarkScreen({super.key});

  @override
  State<LandmarkScreen> createState() => _LandmarkScreenState();
}

class _LandmarkScreenState extends State<LandmarkScreen> {
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
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Material(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(9),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: () {
                        //
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 23,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(top: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search for Landmark',
                    hintFadeDuration: Durations.short3,
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 10, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  Text(
                    'Landmark Selection',
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LandmarkBtn(
                      placeName: 'Monas',
                      imagePath: 'assets/images/contoh2.png',
                    ),
                    LandmarkBtn(
                      placeName: 'Gedung Sate',
                      imagePath: 'assets/images/image_widget.png',
                    ),
                    LandmarkBtn(
                      placeName: 'Pangandaran Beach',
                      imagePath: 'assets/images/image_widget.png',
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LandmarkBtn(
                      placeName: 'Pangalengan Tea Garden',
                      imagePath: 'assets/images/image_widget.png',
                    ),
                    LandmarkBtn(
                      placeName: 'TSM',
                      imagePath: 'assets/images/image_widget.png',
                    ),
                    LandmarkBtn(
                      placeName: 'Borobudur',
                      imagePath: 'assets/images/image_widget.png',
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
