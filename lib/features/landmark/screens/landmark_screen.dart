import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/landmark/model/landmark_model.dart';
import 'package:flutter_project/features/landmark/screens/landmarkresult.dart';
import 'package:flutter_project/features/notification/screens/notification_page.dart';
import 'package:flutter_project/features/profile/screens/setting_page.dart';
import 'package:flutter_project/features/search/widgets/custom_search_text.dart';
import 'package:flutter_project/features/landmark/widgets/landmark_btn.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:flutter_project/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LandmarkScreen extends StatefulWidget {
  static const String routeName = '/landmark-screen';
  const LandmarkScreen({super.key});

  @override
  State<LandmarkScreen> createState() => _LandmarkScreenState();
}

class _LandmarkScreenState extends State<LandmarkScreen> {
  static List<LandmarkModel> main_landmark_list = [];
  List<LandmarkModel> display_list = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _getData() async {
    try {
      final response = await http.get(
        Uri.parse('${ipaddr}/ta_projek/crudtaprojek/read_landmark.php'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<LandmarkModel> landmarkList = jsonData.map((data) {
          return LandmarkModel(data['landmark_url'], data['landmark_name']);
        }).toList();

        setState(() {
          main_landmark_list = landmarkList;
          display_list = List.from(main_landmark_list);
          print(main_landmark_list[0].landmark_name);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
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
        height: MediaQuery.of(context).size.height,
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
            SizedBox(
              height: 20,
            ),
            Container(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.0, // Spacing between items
                  runSpacing: 8.0, // Spacing between lines
                  children: [
                    for (int i = 0; i < 6; i++)
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context,
                          //     LandmarkResult
                          //         .routeName); // Print the placeName or placeholder name
                        },
                        child: LandmarkBtn(
                          placeName: i < display_list.length
                              ? display_list[i].landmark_name!
                              : 'Placeholder Name', // or some default name
                          imagePath: i < display_list.length
                              ? display_list[i]
                                  .landmark_url!
                                  .replaceAll('\\', '')
                              : 'assets/images/bookit.png', // or some default image path
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
