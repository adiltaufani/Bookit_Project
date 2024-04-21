import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/common/widgets/custom_texfield.dart';
import 'package:flutter_project/features/auth/widgets/transaction_ongoing.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  static const String routeName = '/payment-page';
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

List<String> options = ['option 1', 'option2'];

class _PaymentPageState extends State<PaymentPage> {
  String selectedOption = options[0];
  final userbookform = GlobalKey<FormState>();
  String gendervalue = 'Mr.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Text(
            '1 of 2: Review Booking',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
      ),
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.4), // Adjust opacity for shadow intensity
                            spreadRadius: 2, // Adjust for desired shadow spread
                            blurRadius: 2, // Adjust for desired blur amount
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 226),
                          margin: EdgeInsets.all(14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Coeurdes Alpes',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                              Text(
                                "Jl. Telekomunikasi, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat, Indonesia 40257\n",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                              Text(
                                "Deluxe Room",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                              Text(
                                "\t• 2 Double Bed",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                              Text(
                                "\t• 4 Guest's/Room\n",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                              Text(
                                "17 Dec 2023 - 18 Dec 2023", //Deluxe Room
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                              Text(
                                "1 Room, 2 Adult, 2 Children", //Deluxe Room
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 94,
                          height: 94,
                          margin: const EdgeInsets.fromLTRB(8, 12, 12, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/image_widget.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // _isdatechoosed = !_isdatechoosed;
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
                                color: const Color(0xFF225B7B),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.4), // Adjust opacity for shadow intensity
                                  spreadRadius:
                                      2, // Adjust for desired shadow spread
                                  blurRadius:
                                      2, // Adjust for desired blur amount
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  color: Color(0xFF225B7B),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '19 May 2024',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF225B7B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
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
                        horizontal: 20.0, vertical: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // _isdatechoosed = !_isdatechoosed;
                          });
                          //choose date
                        },
                        child: Container(
                          height: 54,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF225B7B),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.4), // Adjust opacity for shadow intensity
                                spreadRadius:
                                    2, // Adjust for desired shadow spread
                                blurRadius: 2, // Adjust for desired blur amount
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 4),
                              Text(
                                '2 Room, 2 Adults, 4 Children',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Color(0xFF225B7B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.4), // Adjust opacity for shadow intensity
                            spreadRadius: 2, // Adjust for desired shadow spread
                            blurRadius: 2, // Adjust for desired blur amount
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 226),
                      margin: const EdgeInsets.all(14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'I\'m booking for',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 36,
                                child: RadioListTile(
                                  title: Text(
                                    'Myself',
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.4,
                                      ),
                                    ),
                                  ),
                                  activeColor: const Color(0xFF225B7B),
                                  value: options[0],
                                  selected: false,
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value.toString();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 44,
                                child: RadioListTile(
                                  title: Text(
                                    'Someone Else',
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.4,
                                      ),
                                    ),
                                  ),
                                  activeColor: const Color(0xFF225B7B),
                                  value: options[1],
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 6.0, right: 6, top: 12),
                            child: Divider(
                              color: Colors.black12,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Form(
                              key: userbookform,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                      hintText: 'email',
                                      hintStyle: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.black26,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                      labelStyle: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF225B7B),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(
                                                0xFF225B7B)), // Warna garis saat aktif/fokus
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(
                                                0xFF225B7B)), // Warna garis saat aktif/fokus
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value!)) {
                                        return "Enter Correct username";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 6.0, top: 32),
                                          child: DropdownButton<String>(
                                            items: const [
                                              DropdownMenuItem<String>(
                                                value: 'Mr.',
                                                child: Text('Mr.'),
                                              ),
                                              DropdownMenuItem<String>(
                                                value: 'Mrs.',
                                                child: Text('Mrs.'),
                                              ),
                                            ],
                                            onChanged: (String? value) {
                                              setState(() {
                                                gendervalue = value.toString();
                                              });
                                            },
                                            hint: Text(
                                              gendervalue,
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.4,
                                                ),
                                              ),
                                            ),
                                            underline: Container(
                                              height: 1,
                                              color: Color(0xFF225B7B),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down_rounded,
                                              color: Color(0xFF225B7B),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'First Name',
                                              labelStyle:
                                                  GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  color: Color(0xFF225B7B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.4,
                                                ),
                                              ),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(
                                                        0xFF225B7B)), // Warna garis saat aktif/fokus
                                              ),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(
                                                        0xFF225B7B)), // Warna garis saat aktif/fokus
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  !RegExp(r'^[a-z A-Z]+$')
                                                      .hasMatch(value!)) {
                                                return "Enter Correct username";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Last Name',
                                            labelStyle: GoogleFonts.montserrat(
                                              textStyle: const TextStyle(
                                                color: Color(0xFF225B7B),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.4,
                                              ),
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(
                                                      0xFF225B7B)), // Warna garis saat aktif/fokus
                                            ),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(
                                                      0xFF225B7B)), // Warna garis saat aktif/fokus
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(r'^[a-z A-Z]+$')
                                                    .hasMatch(value!)) {
                                              return "Enter Correct username";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      labelStyle: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF225B7B),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(
                                                0xFF225B7B)), // Warna garis saat aktif/fokus
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(
                                                0xFF225B7B)), // Warna garis saat aktif/fokus
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value!)) {
                                        return "Enter Correct username";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'City of Origin',
                                      labelStyle: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Color(0xFF225B7B),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(
                                                0xFF225B7B)), // Warna garis saat aktif/fokus
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(
                                                0xFF225B7B)), // Warna garis saat aktif/fokus
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value!)) {
                                        return "Enter Correct username";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.4), // Adjust opacity for shadow intensity
                            spreadRadius: 2, // Adjust for desired shadow spread
                            blurRadius: 2, // Adjust for desired blur amount
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 226),
                      margin: const EdgeInsets.all(14),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Method',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 36,
                                  child: RadioListTile(
                                    title: Text(
                                      'Pay Now',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                    ),
                                    activeColor: const Color(0xFF225B7B),
                                    value: options[0],
                                    selected: false,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 44,
                                  child: RadioListTile(
                                    title: Text(
                                      'Pay on the Spot',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                    ),
                                    activeColor: const Color(0xFF225B7B),
                                    value: options[1],
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, PaymentPage.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 52),
                        elevation: 2,
                        backgroundColor: const Color(0xFF225B7B),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12.0), // Adjust as needed
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
            ),
          ),
        ],
      ),
    );
  }
}
