import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/appbar_global.dart';
import 'package:flutter_project/features/auth/services/auth/google_auth_service.dart';
import 'package:flutter_project/features/notification/screens/notification_page.dart';
import 'package:flutter_project/features/profile/screens/setting_page.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:flutter_project/features/payment/widgets/transaction_ongoing.dart';
import 'package:flutter_project/features/search/widgets/search_page_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreen extends StatefulWidget {
  static const String routeName = '/transaction-screen';
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late double _rating;

  final GoogleAuthService authService = GoogleAuthService();
  bool isTextFieldFocused = false;
  bool _isTextVisible = false;
  bool _isconstscrolled = false;
  double _initialRating = 0;
  bool _isUp = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  @override
  void initState() {
    super.initState();
    _rating = _initialRating;
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
          title: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SearchPageWidget.routeName);
            },
            child: Container(
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.black26,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Search..',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
            FutureBuilder<String?>(
                future: ProfileDataManager.getProfilePic(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SettingPage.routeName);
                      },
                      icon: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white30,
                        backgroundImage: NetworkImage(snapshot.data!),
                      ),
                    );
                  } else {
                    return Text('no data');
                  }
                }),
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
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
                        'assets/images/transaction.png',
                        height: 30,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Transaction',
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
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'On Going',
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.4,
                          ),
                        ),
                      ),
                      TransactionOngoing(),
                      Text(
                        'Recent',
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.4,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
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
                                              width: 88,
                                              height: 88,
                                              margin: const EdgeInsets.fromLTRB(
                                                  12, 12, 2, 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/image_widget.png'),
                                                    fit: BoxFit.cover),
                                                // image: NetworkImage(cleanedUrlFoto),
                                                // fit: BoxFit.cover),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
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
                                                            'Alphine Hotel', //_Listdata[index]['nama_penginapan'],
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
                                                                        6.0),
                                                            child:
                                                                AnimatedSwitcher(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    child: _isTextVisible
                                                                        ? Container(
                                                                            child:
                                                                                Container(
                                                                              constraints: const BoxConstraints(maxWidth: 172),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    "Jl. Telekomunikasi, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat, Indonesia 40257\n",
                                                                                    // _Listdata[index]['alamat'],
                                                                                    style: GoogleFonts.montserrat(
                                                                                      textStyle: const TextStyle(
                                                                                        color: Colors.black54,
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        letterSpacing: -0.6,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "17 Dec 2023 - 18 Dec 2023\n",
                                                                                    // _Listdata[index]['tanggal reservasi'],
                                                                                    style: GoogleFonts.montserrat(
                                                                                      textStyle: const TextStyle(
                                                                                        color: Colors.black54,
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        letterSpacing: -0.6,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "Deluxe Room\n",
                                                                                    // _Listdata[index]['jenis kamar'],
                                                                                    style: GoogleFonts.montserrat(
                                                                                      textStyle: const TextStyle(
                                                                                        color: Colors.black54,
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        letterSpacing: -0.6,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "1 Room, 2 Adult, 2 Children\n",
                                                                                    // _Listdata[index]['kamar']['jumlah orang'],
                                                                                    style: GoogleFonts.montserrat(
                                                                                      textStyle: const TextStyle(
                                                                                        color: Colors.black54,
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        letterSpacing: -0.6,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "Payment Method",
                                                                                    style: GoogleFonts.montserrat(
                                                                                      textStyle: const TextStyle(
                                                                                        color: Colors.black87,
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: -0.6,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "Pay On Destination\n",
                                                                                    // _Listdata[index]['jenis pembayaran'],
                                                                                    style: GoogleFonts.montserrat(
                                                                                      textStyle: const TextStyle(
                                                                                        color: Colors.black54,
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        letterSpacing: -0.6,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : Container(
                                                                            child:
                                                                                Container(
                                                                              constraints: const BoxConstraints(maxWidth: 172),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  const SizedBox(
                                                                                    height: 8,
                                                                                  ),
                                                                                  Text(
                                                                                    "17 Dec 2023 - 18 Dec 2023",
                                                                                    // _Listdata[index]['tanggal reservasi'],
                                                                                    style: GoogleFonts.montserrat(
                                                                                      textStyle: const TextStyle(
                                                                                        color: Colors.black54,
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        letterSpacing: -0.6,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "Deluxe Room\n",
                                                                                    // _Listdata[index]['jenis kamar'],
                                                                                    style: GoogleFonts.montserrat(
                                                                                      textStyle: const TextStyle(
                                                                                        color: Colors.black54,
                                                                                        fontSize: 11,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        letterSpacing: -0.6,
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
                                              duration: const Duration(
                                                  milliseconds: 300),
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
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Total Payment',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: -0.6,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Rp.',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF225B7B),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing: -0.6,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'harga', //formatInteger(_Listdata[index]['harga'].toString())
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF225B7B),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing: -0.6,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'review',
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
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: RatingBar(
                                                    initialRating: 0,
                                                    minRating: 1,
                                                    ratingWidget: RatingWidget(
                                                        full: Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        half: Icon(
                                                          Icons.star,
                                                        ),
                                                        empty: Icon(
                                                          Icons.star,
                                                          color: Colors.grey,
                                                        )),
                                                    itemSize: 20,
                                                    updateOnDrag: true,
                                                    glow: false,
                                                    onRatingUpdate: (rating) {
                                                      setState(() {
                                                        _rating = rating;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
