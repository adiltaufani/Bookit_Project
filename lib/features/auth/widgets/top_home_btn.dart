import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/widgets/property_type_btn.dart';

class TopHomeBtn extends StatefulWidget {
  const TopHomeBtn({Key? key}) : super(key: key);

  @override
  State<TopHomeBtn> createState() => _TopHomeBtnState();
}

class _TopHomeBtnState extends State<TopHomeBtn> {
  Color textColorA = Colors.white;
  Color buttonColorA = Color(0xFF225B7B);
  Color textColorB = Color(0xFF858585);
  Color buttonColorB = Color(0xFFF0F0F0);
  Color textColorC = Color(0xFF858585);
  Color buttonColorC = Color(0xFFF0F0F0);
  Color textColorD = Color(0xFF858585);
  Color buttonColorD = Color(0xFFF0F0F0);
  Color textColorE = Color(0xFF858585);
  Color buttonColorE = Color(0xFFF0F0F0);

  void _onButtonPressed(String buttonText) {
    setState(() {
      // Reset warna semua tombol
      textColorA = Color(0xFF858585);
      buttonColorA = Color(0xFFF0F0F0);
      textColorB = Color(0xFF858585);
      buttonColorB = Color(0xFFF0F0F0);
      textColorC = Color(0xFF858585);
      buttonColorC = Color(0xFFF0F0F0);
      textColorD = Color(0xFF858585);
      buttonColorD = Color(0xFFF0F0F0);
      textColorE = Color(0xFF858585);
      buttonColorE = Color(0xFFF0F0F0);

      // Tentukan tombol mana yang ditekan dan atur warnanya
      switch (buttonText) {
        case 'A':
          textColorA = Colors.white;
          buttonColorA = Color(0xFF225B7B);
          break;
        case 'B':
          textColorB = Colors.white;
          buttonColorB = Color(0xFF225B7B);
          break;
        case 'C':
          textColorC = Colors.white;
          buttonColorC = Color(0xFF225B7B);
          break;
        case 'D':
          textColorD = Colors.white;
          buttonColorD = Color(0xFF225B7B);
          break;
        case 'E':
          textColorE = Colors.white;
          buttonColorE = Color(0xFF225B7B);
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            children: [
              PropertyTypeBtn(
                text: 'House',
                onTap: () => _onButtonPressed('A'),
                buttonColor: buttonColorA,
                textColor: textColorA,
              ),
              PropertyTypeBtn(
                text: 'Apartment',
                onTap: () => _onButtonPressed('B'),
                buttonColor: buttonColorB,
                textColor: textColorB,
              ),
              PropertyTypeBtn(
                text: 'Hotel',
                onTap: () => _onButtonPressed('C'),
                buttonColor: buttonColorC,
                textColor: textColorC,
              ),
              PropertyTypeBtn(
                text: 'Villa',
                onTap: () => _onButtonPressed('D'),
                buttonColor: buttonColorD,
                textColor: textColorD,
              ),
              PropertyTypeBtn(
                text: 'Resort',
                onTap: () => _onButtonPressed('E'),
                buttonColor: buttonColorE,
                textColor: textColorE,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
