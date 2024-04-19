import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/auth/services/google_auth_service.dart';
import 'package:flutter_project/features/auth/widgets/custom_search_text.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends StatefulWidget {
  static const String routeName = '/wishlist-screen';
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List _Listdata = [];

  Future _getdata() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.6/ta_projek/crudtaprojek/read.php'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _Listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  final GoogleAuthService authService = GoogleAuthService();
  bool isTextFieldFocused = false;
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
                    'assets/images/wishlist.png',
                    height: 30,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Wishlist',
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
            Expanded(
              child: ListView.builder(
                itemCount: _Listdata
                    .length, // Ganti dengan jumlah item yang Anda inginkan
                itemBuilder: (BuildContext context, int index) {
                  String cleanedUrlFoto =
                      _Listdata[index]['url_foto'].replaceAll('\\', '');
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 128,
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ), // Atur margin jika diperlukan
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          right: 10,
                          child: InkWell(
                            onTap: _toggleImage,
                            borderRadius: BorderRadius.circular(8),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: _isUp
                                  ? Icon(
                                      Icons.bookmark_rounded,
                                      color: Colors.black54,
                                      size: 28,
                                      key: UniqueKey(),
                                    )
                                  : Icon(
                                      Icons.bookmark_outline_rounded,
                                      color: Colors.black54,
                                      size: 28,
                                      key: UniqueKey(),
                                    ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/contoh2.png'),
                                    // image: NetworkImage(cleanedUrlFoto),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Eucalypt House',
                                      // _Listdata[index]['nama_penginapan'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rp.',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 8, 59, 134),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Text(
                                        '20.000.000'
                                        // formatInteger(_Listdata[index]['harga'].toString())
                                        , // Mengonversi integer ke string sebelum memanggil formatInteger
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 8, 59, 134),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Text(
                                        ' / night',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 8, 59, 134),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/bedroom.png',
                                        height: 24.0,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '2',
                                        // _Listdata[index]['bedroom'],
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.6,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3.5,
                                      ),
                                      Text(
                                        'Bedroom',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.6,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Image.asset(
                                        'assets/images/bathroom.png',
                                        height: 24.0,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '3',
                                        // _Listdata[index]['bathroom'],
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.6,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3.5,
                                      ),
                                      Text(
                                        'Bathroom',
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatInteger(String numberString) {
    // Mengonversi string ke integer
    int number = int.parse(numberString);

    // Membuat objek NumberFormat untuk memformat angka
    NumberFormat formatter = NumberFormat("#,##0", "en_US");
    return formatter.format(number);
  }
}
