import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomType extends StatefulWidget {
  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  bool isTextFieldFocused = false;
  bool _isroomchoosed = true;
  //nama room
  //jumlah + jenis bed
  //kapasitas kamar
  //harga
  //availability
  //foto room

  @override
  Widget build(BuildContext context) {
    //listview
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
                            width: 162,
                            height: 102,
                            margin: const EdgeInsets.fromLTRB(12, 12, 2, 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/room.jpeg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 12, 0, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Deluxe Room',
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 172),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.king_bed_rounded,
                                                        color: Colors.black54,
                                                        size: 16),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      "1 Double Bed",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          letterSpacing: -0.6,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.group_rounded,
                                                        color: Colors.black54,
                                                        size: 16),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      "4 Guest's/Room",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Text.rich(
                              TextSpan(
                                  text: 'Rp 1.000.000/',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF225B7B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.6,
                                    ),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Night',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                        child: _isroomchoosed
                            ? ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isroomchoosed = !_isroomchoosed;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF225B7B),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Select',
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
                            : ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isroomchoosed = !_isroomchoosed;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.84),
                                  elevation: 2,
                                  side: BorderSide(
                                      color: const Color(0xFF225B7B),
                                      width: 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Selected',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF225B7B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
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
  }
}
