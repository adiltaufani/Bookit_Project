import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/common/widgets/custom_texfield.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/search_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/auth/widgets/custom_search_text.dart';
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
                            color: Colors.grey,
                          ),
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.all(4.0),
                hintText: 'Search..',
                border: InputBorder.none,
                alignLabelWithHint: true,
                hintMaxLines: 1,
              ),
              onChanged: _filterKota,
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
      body: Column(
        children: [
          // Teks 'data' di luar SingleChildScrollView sehingga tidak ter-scroll
          Row(
            children: [
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2024-04-02',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                        Text(
                          'Rabu',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text('-'),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2024-04-04',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                        Text(
                          'Jumat',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 26,
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'o1 Room',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                        Text(
                          '01 Guest(s)',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10),

          // Expanded memastikan bahwa ListView.builder tumbuh sesuai dengan ruang yang tersedia
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _foundKota.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
