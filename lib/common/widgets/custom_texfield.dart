import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFF0077B2),
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFF0077B2),
        )),
        hintStyle: TextStyle(
          color: Color(0xFF2FB0FA),
          fontFamily: 'OutfitBlod',
        ),
        fillColor: Color(0xFF0077B2),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
