import 'dart:async';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionRecent extends StatefulWidget {
  const TransactionRecent({super.key});

  @override
  State<TransactionRecent> createState() => _TransactionRecentState();
}

class _TransactionRecentState extends State<TransactionRecent> {
  List _Listdata = [];

  Future _getdata() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.100.10/ta_projek/crudtaprojek/read.php'),
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

  bool isTextFieldFocused = false;
  bool _isTextVisible = false;
  bool _isconstscrolled = false;
  bool _isUp = false;

  TextEditingController _searchController = TextEditingController();

  void _toggleImage() {
    setState(() {
      _isUp = !_isUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount:
            _Listdata.length, // Ganti dengan jumlah item yang Anda inginkan
        itemBuilder: (BuildContext context, int index) {
          String cleanedUrlFoto =
              _Listdata[index]['url_foto'].replaceAll('\\', '');
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRect(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: _isconstscrolled ? 338 : 172,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 88,
                                  height: 88,
                                  margin:
                                      const EdgeInsets.fromLTRB(12, 12, 2, 10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image_widget.png'),
                                        fit: BoxFit.cover),
                                    // image: NetworkImage(cleanedUrlFoto),
                                    // fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 12, 0, 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Alphine Hotel', //_Listdata[index]['nama_penginapan'],
                                                style: GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: -0.6,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 6.0),
                                                child: AnimatedSwitcher(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    child: _isTextVisible
                                                        ? Container(
                                                            child: Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                      maxWidth:
                                                                          172),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Jl. Telekomunikasi, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat, Indonesia 40257\n",
                                                                    // _Listdata[index]['alamat'],
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            -0.6,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "17 Dec 2023 - 18 Dec 2023\n",
                                                                    // _Listdata[index]['tanggal reservasi'],
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            -0.6,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "Deluxe Room\n",
                                                                    // _Listdata[index]['jenis kamar'],
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            -0.6,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "1 Room, 2 Adult, 2 Children\n",
                                                                    // _Listdata[index]['kamar']['jumlah orang'],
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            -0.6,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "Payment Method",
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        letterSpacing:
                                                                            -0.6,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "Pay On Destination\n",
                                                                    // _Listdata[index]['jenis pembayaran'],
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            -0.6,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        : Container(
                                                            child: Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                      maxWidth:
                                                                          172),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Text(
                                                                    "17 Dec 2023 - 18 Dec 2023",
                                                                    // _Listdata[index]['tanggal reservasi'],
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            -0.6,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "Deluxe Room\n",
                                                                    // _Listdata[index]['jenis kamar'],
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        letterSpacing:
                                                                            -0.6,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: _toggleDetail,
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    20.0), // Adjust the padding as needed
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: _isUp
                                      ? Image.asset(
                                          'assets/images/arrow_up.png',
                                          height: 12,
                                          key: UniqueKey(),
                                        )
                                      : Image.asset(
                                          'assets/images/arrow_down.png',
                                          height: 12,
                                          key: UniqueKey(),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Total Payment',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.6,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Rp.',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF225B7B),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -0.6,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        formatInteger(_Listdata[index]['harga']
                                            .toString()), // Mengonversi integer ke string sebelum memanggil formatInteger
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF225B7B),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -0.6,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF225B7B),
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Reschedule/Cancel',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.6,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _toggleDetail() {
    setState(() {
      _isUp = !_isUp;

      if (!_isTextVisible) {
        _isconstscrolled = !_isconstscrolled;
        Timer(const Duration(milliseconds: 200), () {
          _textvis();
        });
      } else {
        _isTextVisible = !_isTextVisible;
        Timer(const Duration(milliseconds: 0), () {
          _constvis();
        });
      }
    });
  }

  void _textvis() {
    setState(() {
      _isTextVisible = !_isTextVisible;
    });
  }

  void _constvis() {
    setState(() {
      _isconstscrolled = !_isconstscrolled;
    });
  }

  String formatInteger(String numberString) {
    // Mengonversi string ke integer
    int number = int.parse(numberString);

    // Membuat objek NumberFormat untuk memformat angka
    NumberFormat formatter = NumberFormat("#,##0", "en_US");
    return formatter.format(number);
  }
}
