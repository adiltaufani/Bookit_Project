import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/common/widgets/custom_texfield.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:flutter_project/features/notification/screens/notification_page.dart';
import 'package:flutter_project/features/profile/screens/setting_page.dart';
import 'package:flutter_project/features/search/screens/search_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageWidget extends StatefulWidget {
  static const String routeName = '/search-page-widget';
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late TextEditingController _searchControllerr;
  final TextEditingController _tanggalawal = TextEditingController();
  final TextEditingController _tanggalakhir = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isTextFieldFocused = false;

  final List<String> _listKota = [
    'Jakarta',
    'Bali',
    'Surabaya',
    'Bandung',
    'Medan',
    'Makassar',
    'Palembang',
    'Bekasi',
    'Surakarta',
    'Manado',
    'Mataram',
    'Pontianak',
    'Kupang',
    'Banjarmasin',
    'Jogja',
    'Ternate',
  ];
  List _foundKota = [];

  @override
  void initState() {
    _searchControllerr = TextEditingController();
    _foundKota = _listKota;
    print(_foundKota);
    super.initState();
  }

  @override
  void dispose() {
    _searchControllerr.dispose();
    _tanggalawal.dispose();
    _tanggalakhir.dispose();
    super.dispose();
  }

  void _filterKota(String query) {
    List<String> results = [];
    if (query.isEmpty) {
      results = _listKota;
    } else {
      results = _listKota
          .where((kota) => kota.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundKota = results;
      print('ini found kota $_foundKota');
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
          title: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              controller: _searchControllerr,
              decoration: InputDecoration(
                prefixIcon:
                    isTextFieldFocused || _searchControllerr.text.isNotEmpty
                        ? null
                        : const Icon(
                            Icons.search,
                            color: Colors.black26,
                          ),
                hintStyle: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    color: Colors.black26,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.6,
                  ),
                ),
                contentPadding: const EdgeInsets.all(4.0),
                hintText: 'Search..',
                border: InputBorder.none,
                alignLabelWithHint: true,
                hintMaxLines: 1,
              ),
              onChanged: _filterKota,
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
      body: Column(
        children: [
          // Teks 'data' di luar SingleChildScrollView sehingga tidak ter-scroll
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            '30, Apr 2024',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color(0xFF225B7B),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.6,
                              ),
                            ),
                          ),
                          Text(
                            'Tuesday',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.6,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                '-',
                style: TextStyle(color: Colors.black38, fontSize: 18),
              ),
              Expanded(
                flex: 3,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            '01, May 2024',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color(0xFF225B7B),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.6,
                              ),
                            ),
                          ),
                          Text(
                            'Wednesday',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.6,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 38,
                width: 2,
                child: Container(
                  color: Colors.black12,
                ),
              ),
              Expanded(
                flex: 2,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Text(
                            '01 Room',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color(0xFF225B7B),
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.6,
                              ),
                            ),
                          ),
                          Text(
                            '02 Guest(s)',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.6,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),

          // Expanded memastikan bahwa ListView.builder tumbuh sesuai dengan ruang yang tersedia
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _foundKota.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final kota = _foundKota[index];
                    return ListTile(
                      title: Text(kota),
                      onTap: () {
                        // Aksi yang akan dijalankan ketika item dipilih
                        print('Anda memilih kota: $kota');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchPage(
                                  namaKota: kota,
                                  tanggal_checkin: _tanggalawal.text.toString(),
                                  tanggal_checkout:
                                      _tanggalakhir.text.toString(),
                                )));
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
