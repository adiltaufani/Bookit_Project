import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/payment_page.dart';
import 'package:flutter_project/features/auth/widgets/room_type.dart';
import 'package:flutter_project/features/auth/widgets/transaction_ongoing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  static const String routeName = '/booking-page';
  const BookingPage({
    Key? key,
    required this.locationName,
    required this.locationAddress,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final String locationName;
  final String locationAddress;
  final double latitude;
  final double longitude;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _furniture = [
    "wifi",
    "Gym",
    "pool",
    "toilet",
    "dinner",
  ];

  final Map<String, IconData> _iconMap = {
    "wifi": Icons.wifi_rounded,
    "Gym": Icons.sports_gymnastics_rounded,
    "pool": Icons.pool_rounded,
    "toilet": Icons.wc_outlined,
    "dinner": Icons.local_dining_rounded,
  };

  bool _isButtonPressed = false;
  bool _isdatechoosed = false;
  bool _ispersonchoosed = false;

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
                              Image.asset(
                                'assets/images/im1.jpeg',
                                fit: BoxFit.cover,
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
                          'Pavilion Hotel',
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
                              'Jumlah Review',
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
                              'lokasi',
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
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
                            children: [
                              for (int i = 0; i < 5; i++)
                                //if
                                Container(
                                  width: 80,
                                  height: 80,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 243, 248, 254),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                        color: Colors.black26,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        _iconMap[_furniture[i]],
                                        size: 32,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        _furniture[i],
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ],
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
                            onPressed: () async {
                              _isButtonPressed ? null : _launchMapUrl;
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
                  RoomType(),
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
                    "Rp.199.900.000",
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

  void _launchMapUrl() async {
    setState(() {
      _isButtonPressed = true;
    });
    final urlString =
        'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}';
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Handle error if unable to launch URL
    }
    setState(() {
      _isButtonPressed = false;
    });
  }
}
