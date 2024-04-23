import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_project/features/auth/widgets/futniture_widget.dart';
import 'package:flutter_project/features/auth/screens/payment_page.dart';
import 'package:flutter_project/features/auth/widgets/room_type.dart';
import 'package:flutter_project/features/auth/widgets/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = '/booking-page';
  const BookingPage({
    Key? key,
    required this.locationName,
    required this.locationAddress,
    required this.jumlah_reviewer,
    required this.url_foto,
    required this.id,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final String locationName;
  final String locationAddress;
  final String jumlah_reviewer;
  final String url_foto;
  final String id;
  final String latitude;
  final String longitude;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  double lat = -6.975003032183382;
  double long = 107.64594257899627;
  late Future<Map<String, bool>> futureFurnitureData;
  final _furniture = [
    "wifi",
    "Gym",
    "pool",
    "toilet",
    "Breakfast",
  ];

  final Map<String, IconData> _iconMap = {
    "wifi": Icons.wifi_rounded,
    "Gym": Icons.sports_gymnastics_rounded,
    "pool": Icons.pool_rounded,
    "toilet": Icons.wc_outlined,
    "Breakfast": Icons.local_dining_rounded,
  };
  List _Listdata = [];

  Future _getdata() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://192.168.1.13/ta_projek/crudtaprojek/get_rooms_byid.php?uid=${widget.id}'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _Listdata = data;
          print(_Listdata);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  List<bool> booleanList = List<bool>.filled(10, true);
  bool _isButtonPressed = false;
  bool _isdatechoosed = false;
  bool _ispersonchoosed = false;
  String hargaa = '';
  double totalHarga = 0;
  String hargaFix = 'Rp.0';

  @override
  void initState() {
    futureFurnitureData = fetchFurnitureData();
    _getdata();
    print('asdasdasd ${futureFurnitureData}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 167, 205, 239), // Warna gradient awal
                  Color(0xFFFFFFFF), // Warna gradient akhir
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ImageSlideshow(
                            indicatorColor: const Color(0xFF0A8ED9),
                            indicatorBackgroundColor: Colors.white60,
                            autoPlayInterval: 5000,
                            indicatorRadius: 4,
                            isLoop: true,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.url_foto),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Image.asset(
                                'assets/images/im2.jpeg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/im3.jpeg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/im3.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black38.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          widget.locationName,
                          // _Listdata[index]['jumlah_reviewer'],
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0xFFDF9652)),
                            const SizedBox(width: 6),
                            Text(
                              widget.jumlah_reviewer,
                              // _Listdata[index]['jumlah_reviewer'],
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFF00A5EC),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              widget.locationAddress,
                              // _Listdata[index]['lokasi'],
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(
                            '${widget.id} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                            // _Listdata[index]['lokasi'],
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Facilities',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [FurniturePage(id: widget.id)],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Location',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFF00A5EC),
                            ),
                            const SizedBox(width: 2),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(
                                widget.locationAddress,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Material(
                          color: Colors
                              .transparent, // Ensure transparent background
                          child: ElevatedButton(
                            onPressed: () {
                              _openMap(lat, long);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0A8ED9),
                              fixedSize: const Size(120, 34),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              elevation: 2,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 2.0),
                              textStyle: const TextStyle(
                                fontSize: 16.0, // Adjust font size
                                fontWeight:
                                    FontWeight.bold, // Adjust font weight
                                color: Colors.white, // Use white text color
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                  size: 15.0,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'View on Map',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Date of Your Stay',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isdatechoosed = !_isdatechoosed;
                                });
                                //choose date
                              },
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: _isdatechoosed
                                          ? Colors.blue
                                          : Colors.black45,
                                      width: 2,
                                    ),
                                  ),
                                  child: _isdatechoosed
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month_rounded,
                                              color: Color(0xFF0A8ED9),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '19 May 2024',
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month_rounded,
                                              color: Colors.black45,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Choose a date',
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _ispersonchoosed = !_ispersonchoosed;
                                });
                                //add person
                              },
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: _ispersonchoosed
                                          ? Colors.blue
                                          : Colors.black45,
                                      width: 2,
                                    ),
                                  ),
                                  child: _ispersonchoosed
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.group_sharp,
                                              color: Color(0xFF0A8ED9),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '2 Adults, 1 child',
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.group_sharp,
                                              color: Colors.black45,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Add Guest\'s',
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Room Type',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _Listdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ClipRect(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: 190,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 162,
                                                height: 102,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 12, 2, 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(10),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/room.jpeg'),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 12, 0, 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              _Listdata[index][
                                                                  'tipe_kamar'],
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                textStyle:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  letterSpacing:
                                                                      -0.6,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          2.0),
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
                                                                        height:
                                                                            8),
                                                                    Row(
                                                                      children: [
                                                                        const Icon(
                                                                            Icons
                                                                                .king_bed_rounded,
                                                                            color:
                                                                                Colors.black54,
                                                                            size: 16),
                                                                        const SizedBox(
                                                                            width:
                                                                                8),
                                                                        Text(
                                                                          "${_Listdata[index]['bedroom']} Bed",
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            textStyle:
                                                                                const TextStyle(
                                                                              color: Colors.black54,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              letterSpacing: -0.6,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        const Icon(
                                                                            Icons
                                                                                .group_rounded,
                                                                            color:
                                                                                Colors.black54,
                                                                            size: 16),
                                                                        const SizedBox(
                                                                            width:
                                                                                8),
                                                                        Text(
                                                                          "${_Listdata[index]['kapasitas']} Guest's/Room",
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            textStyle:
                                                                                const TextStyle(
                                                                              color: Colors.black54,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              letterSpacing: -0.6,
                                                                            ),
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
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 0, 0, 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Total Payment',
                                                  style: GoogleFonts.montserrat(
                                                    textStyle: const TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.6,
                                                    ),
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                      text:
                                                          'Rp ${_Listdata[index]['harga']}/',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle:
                                                            const TextStyle(
                                                          color:
                                                              Color(0xFF225B7B),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          letterSpacing: -0.6,
                                                        ),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: 'Night',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 8),
                                            child: booleanList[index]
                                                ? ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        booleanList[index] =
                                                            false;
                                                        hargaa =
                                                            _Listdata[index]
                                                                ['harga'];
                                                        harga = double.parse(
                                                            hargaa);
                                                        totalHarga += harga;
                                                        hargaFix =
                                                            'Rp. $totalHarga';
                                                        print(totalHarga);
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color(
                                                              0xFF225B7B),
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Select',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: -0.6,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        booleanList[index] =
                                                            true;
                                                        hargaa =
                                                            _Listdata[index]
                                                                ['harga'];
                                                        harga = double.parse(
                                                            hargaa);
                                                        totalHarga -= harga;
                                                        hargaFix =
                                                            'Rp. $totalHarga';
                                                        print(totalHarga);
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: Colors
                                                          .white
                                                          .withOpacity(0.84),
                                                      elevation: 2,
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFF225B7B),
                                                          width: 1.0),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Selected',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle:
                                                            const TextStyle(
                                                          color:
                                                              Color(0xFF225B7B),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: -0.6,
                                                        ),
                                                      ),
                                                    ),
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
                      }),
                  const SizedBox(height: 64),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PaymentPage.routeName);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.infinity, 52),
                elevation: 2,
                backgroundColor: const Color(0xFF225B7B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Adjust as needed
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hargaFix,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                  Text(
                    "Book Now",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openMap(double lat, double long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
  }

  // void _launchMapUrl() async {
  //   setState(() {
  //     print('truee');
  //     _isButtonPressed = true;
  //   });
  //   final urlString =
  //       'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}';
  //   final url = Uri.parse(urlString);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     print('ererere');
  //   }
  //   setState(() {
  //     _isButtonPressed = false;
  //   });
  // }

  Future<Map<String, bool>> fetchFurnitureData() async {
    final url =
        'http://192.168.1.13/ta_projek/crudtaprojek/get_furniture.php?id=${widget.id}'; // Ganti URL dengan URL API Anda

    // Lakukan permintaan HTTP GET ke API
    final response = await http.get(Uri.parse(url));

    // Periksa apakah permintaan berhasil
    if (response.statusCode == 200) {
      // Parse respons JSON
      print(response.body);
      List<dynamic> data = json.decode(response.body);

      // Konversi data ke Map<String, bool>
      Map<String, bool> furnitureData = {
        "wifi": int.parse(data[0]['wifi']) == 1,
        "Gym": int.parse(data[0]['pusat_kebugaran']) == 1,
        "pool": int.parse(data[0]['kolam_renang']) == 1,
        "toilet": int.parse(data[0]['parkir']) == 1,
        "Breakfast": int.parse(data[0]['restoran']) == 1,
      };
      print(furnitureData);
      return furnitureData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
