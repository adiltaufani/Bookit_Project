import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF0077B2),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF0077B2),
          ),
        ),
        hintStyle: TextStyle(
          color: Color(0xFF2FB0FA),
          fontFamily: 'OutfitBlod',
        ),
        fillColor: Color(0xFF0077B2),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your ${widget.hintText}';
        }
        return null;
      },
    );
  }
}
