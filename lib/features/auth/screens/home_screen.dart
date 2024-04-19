import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/screens/home_apartement.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/search_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/auth/services/google_auth_service.dart';
import 'package:flutter_project/features/auth/widgets/custom_search_text.dart';
import 'package:flutter_project/features/auth/widgets/nearfrom_btn.dart';
import 'package:flutter_project/features/auth/widgets/top_home_btn.dart';
import 'package:flutter_project/features/home/screens/near_from_you.dart';
import 'package:flutter_project/features/home/widgets/home_hotel.dart';
import 'package:flutter_project/features/home/widgets/home_house.dart';
import 'package:flutter_project/features/home/widgets/home_resort.dart';
import 'package:flutter_project/features/home/widgets/home_villa.dart';
import 'package:flutter_project/features/search/widgets/search_page_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List _Listdata = [];
  bool _isSearchPageVisible = false;
  Future _getdata() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.100.13/ta_projek/crudtaprojek/read.php'),
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
    runPHPCodeOnHomeScreen();
    super.initState();
  }

  final GoogleAuthService authService = GoogleAuthService();
  bool isTextFieldFocused = true;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);
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
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchPageWidget.routeName);
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontFamily: 'OutfitBlod',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 127, vertical: 10),
                ),
              ),
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
      body: SingleChildScrollView(
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
              Container(
                height: 120,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _Listdata.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    String cleanedUrlFoto =
                        _Listdata[index]['url_foto'].replaceAll('\\', '');
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(cleanedUrlFoto),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: 5), // Spasi antara gambar dan teks
                          Text(
                            _Listdata[index]['nama_kota'],
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Align(
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 0, right: 40),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator:
                        CircleTabIndicator(color: Colors.blue, radius: 4),
                    tabs: [
                      Tab(
                        child: Text(
                          'House',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Apartement',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Hotel',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Villa',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Resort',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const HomeHouse(),
                    const HomeApartement(),
                    const HomeHotel(),
                    const HomeVilla(),
                    const HomeResort(),
                  ],
                ),
              ),
            ],
          ),
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

  Future<void> runPHPCodeOnHomeScreen() async {
    final url =
        'http://192.168.100.10/ta_projek/crudtaprojek/update_harga_termurah.php'; // Ganti dengan URL endpoint PHP Anda
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Permintaan berhasil
        print('PHP code executed successfully.');
      } else {
        // Terjadi kesalahan
        print('Failed to execute PHP code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while executing PHP code: $e');
    }
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
