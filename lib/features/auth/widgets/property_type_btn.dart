import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyTypeBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color buttonColor;
  final Color textColor;

  const PropertyTypeBtn({
    Key? key,
    required this.text,
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 36,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            child: OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide.none),
              ),
              onPressed: onTap,
              child: Text(
                text,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: textColor,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
