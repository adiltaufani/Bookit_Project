import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandmarkBtn extends StatefulWidget {
  final String placeName;
  final String imagePath;

  const LandmarkBtn(
      {Key? key, required this.placeName, required this.imagePath})
      : super(key: key);

  @override
  State<LandmarkBtn> createState() => _LandmarkBtnState();
}

class _LandmarkBtnState extends State<LandmarkBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Image with Rounded Corners
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            // Shadow Overlay
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.68),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // Text Overlay
            Positioned(
              bottom: 12,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 100),
                    child: Text(
                      widget
                          .placeName, // Menggunakan widget.placeName dari State
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.6,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
