import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/home/screens/near_from_you.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeResort extends StatefulWidget {
  const HomeResort({super.key});

  @override
  State<HomeResort> createState() => _HomeResortState();
}

class _HomeResortState extends State<HomeResort> {
  List _Listdata = [];

  Future _getdata() async {
    try {
      final response = await http.get(
        Uri.parse('http://172.25.112.1/ta_projek/crudtaprojek/readresort.php'),
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              itemCount: _Listdata.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                String cleanedUrlFoto =
                    _Listdata[index]['url_foto'].replaceAll('\\', '');
                return Stack(
                  children: [
                    Container(
                      height: 275,
                      width: 240,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(cleanedUrlFoto),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: 240,
                      height: 275,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius as needed
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black.withOpacity(
                                0.74), // Opacity untuk membuatnya lebih gelap
                            Colors
                                .transparent, // Untuk memberikan transisi ke gambar
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _Listdata[index]['nama_penginapan'],
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            _Listdata[index]['alamat'],
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
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
          SizedBox(
            height: 5,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _Listdata.length,
            itemBuilder: (BuildContext context, int index) {
              String cleanedUrlFoto =
                  _Listdata[index]['url_foto'].replaceAll('\\', '');
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                margin: const EdgeInsets.only(
                  top: 15,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ), // Atur margin jika diperlukan
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(cleanedUrlFoto),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              _Listdata[index]['nama_penginapan'],
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
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                'Rp.',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 8, 59, 134),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Text(
                                formatInteger(_Listdata[index]['harga_termurah']
                                    .toString()), // Mengonversi integer ke string sebelum memanggil formatInteger
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 8, 59, 134),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Text(
                                ' / night',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 8, 59, 134),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/bedroom.png',
                                height: 24.0,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SizedBox(
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
                              SizedBox(
                                width: 8,
                              ),
                              Image.asset(
                                'assets/images/bathroom.png',
                                height: 24.0,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SizedBox(
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
              );
            },
          ),
        ],
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
