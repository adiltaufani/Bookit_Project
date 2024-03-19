import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/services/google_auth_service.dart';
import 'package:flutter_project/features/home/screens/near_from_you.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleAuthService authService = GoogleAuthService();
  bool isTextFieldFocused = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          title: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon:
                      isTextFieldFocused || _searchController.text.isNotEmpty
                          ? null
                          : const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.all(4.0),
                  hintText: 'Search..',
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                  hintMaxLines: 1,
                ),
                onTap: () {
                  setState(() {
                    isTextFieldFocused = true;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    isTextFieldFocused = value.isNotEmpty;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    isTextFieldFocused = false;
                  });
                },
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/notification.png',
                height: 34.0,
              ),
            ),
            IconButton(
              onPressed: () async {
                authService.signOut(context);
              },
              icon: Image.asset(
                'assets/images/profile.png',
                height: 38.0,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
          ),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF757575),
                        ),
                      ),
                      Text(
                        'Jakarta',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/bookit.png',
                    height: 20.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFF225B7B),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), // Warna bayangan
                            spreadRadius: 1, // Radius penyebaran bayangan
                            blurRadius: 2, // Radius blur bayangan
                            offset: const Offset(0,
                                3), // Posisi bayangan relatif terhadap konten
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'House',
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0, // Memberikan jarak horizontal sebesar 8.0
                  ),
                  Expanded(
                    child: Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), // Warna bayangan
                            spreadRadius: 1, // Radius penyebaran bayangan
                            blurRadius: 2, // Radius blur bayangan
                            offset: const Offset(0,
                                3), // Posisi bayangan relatif terhadap konten
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Apartment',
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0, // Memberikan jarak horizontal sebesar 8.0
                  ),
                  Expanded(
                    child: Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), // Warna bayangan
                            spreadRadius: 1, // Radius penyebaran bayangan
                            blurRadius: 2, // Radius blur bayangan
                            offset: const Offset(0,
                                3), // Posisi bayangan relatif terhadap konten
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Hotel',
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0, // Memberikan jarak horizontal sebesar 8.0
                  ),
                  Expanded(
                    child: Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), // Warna bayangan
                            spreadRadius: 1, // Radius penyebaran bayangan
                            blurRadius: 2, // Radius blur bayangan
                            offset: const Offset(0,
                                3), // Posisi bayangan relatif terhadap konten
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Villa',
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 14.0,
                            ),
                          ),
                          //       GoogleFonts.montserrat(
                          //   textStyle: const TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 18.0,
                          //     fontWeight: FontWeight.w500,
                          //     letterSpacing: -0.6,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Near from you',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, NearFromYou.routeName);
                    },
                    child: Text(
                      'See more',
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/contoh.png',
                      height: 280.0,
                    ),
                    Image.asset(
                      'assets/images/contoh.png',
                      height: 280.0,
                    ),
                    Image.asset(
                      'assets/images/contoh.png',
                      height: 280.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best for you',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                  Text(
                    'See more',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/contoh2.png',
                    height: 68.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Orchad House',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                        Text(
                          'Rp.1.200.000.000/Year',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Color(0xFF182C74),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.asset(
                            //   'assets/images/bedroom.png',
                            //   height: 24.0,
                            // ),
                            Text(
                              '6 Bedroom',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Color(0xFF858585),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.6,
                                ),
                              ),
                            ),
                            // Image.asset(
                            //   'assets/images/bathroom.png',
                            //   height: 24.0,
                            // ),
                            Text(
                              '4 Bathroom',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Color(0xFF858585),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.6,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
