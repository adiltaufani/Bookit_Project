import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ReschedulePage extends StatefulWidget {
  static const String routeName = '/reschedule-page';
  // String id;
  // String hotel_id;
  // String nama_penginapan;
  // String lokasi;
  // String hargaTotal;
  // String startDate;
  // String endDate;
  // int adultValue;
  // int childValue;
  // String url_foto;

  ReschedulePage({
    super.key,
    // required this.id,
    // required this.hotel_id,
    // required this.nama_penginapan,
    // required this.lokasi,
    // required this.url_foto,
    // required this.hargaTotal,
    // required this.startDate,
    // required this.endDate,
    // required this.adultValue,
    // required this.childValue
  });

  @override
  State<ReschedulePage> createState() => _ReschedulePageState();
}

List<String> options = ['option 1', 'option2'];
List<String> bookOption = ['option 1', 'option2'];
List<String> paymentOption = ['option 1', 'option2'];

class _ReschedulePageState extends State<ReschedulePage> {
  String selectedOption = options[0];
  String bookSelectedOption = bookOption[0];
  String paySelectedOption = paymentOption[0];
  final userbookform = GlobalKey<FormState>();
  String gendervalue = 'Mr.';
  bool isLoading = true;
  String? _firstname;
  String? lastname;
  String? number;
  String? birthdate;
  String? address;
  String? email;
  bool firstnameTrigger = false;
  bool rescheduleVis = true;

  // List _Listdata = [];

  // Future _getdata() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(
  //           'https://projekta.seculab.space/crudtaprojek/payment_rooms.php?uid=${widget.hotel_id}&id=${widget.id}'),
  //     );
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       fetchData();
  //       setState(() {
  //         _Listdata = data;
  //         isLoading = false;
  //         print(_Listdata);
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // void initState() {
  //   _getdata();
  //   super.initState();
  // }

  // Future<void> fetchData() async {
  //   await fetchUserData();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              title: Text(
                'Reschedule / Cancellation',
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
            )),
        body:
            // isLoading
            //     ? CircularProgressIndicator()
            //     : _Listdata.isNotEmpty
            //         ?
            Stack(
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
                              spreadRadius:
                                  2, // Adjust for desired shadow spread
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
                                  'Alpine', //${widget.nama_penginapan}',
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
                                  "jl. segar dalam", //${widget.lokasi}",
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
                                  "tipe kamar", //${_Listdata[0]['tipe_kamar']}",
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
                                  "jenis bed", //\t• ${_Listdata[0]['bedroom']} Double Bed",
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
                                  "kapasitas room", //\t• ${_Listdata[0]['kapasitas']} Guest's/Room\n",
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
                                  " start-end date", //${widget.startDate} - ${widget.endDate}",
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
                                  "much room and people", //1 Room, ${widget.adultValue} Adult, ${widget.childValue} Children",
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
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/contoh2.png'), //NetworkImage(widget.url_foto),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 12, left: 20, right: 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.4), // Adjust opacity for shadow intensity
                              spreadRadius:
                                  2, // Adjust for desired shadow spread
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
                                        'Reschedule',
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
                                          rescheduleVis = true;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 44,
                                    child: RadioListTile(
                                      title: Text(
                                        'Cancel Book',
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
                                          rescheduleVis = false;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                    rescheduleVis
                        ? Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 12, left: 20, right: 20),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
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
                                    borderRadius: BorderRadius.circular(6)),
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 226),
                                  margin: const EdgeInsets.all(14),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Reason of Reschedule',
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
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter reason here...',
                                                hintStyle:
                                                    GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: -0.4,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF225B7B),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.black38,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              minLines: 3,
                                              maxLines: 7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                        duration:
                                            const Duration(milliseconds: 200),
                                        height: 54,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month_rounded,
                                              color: Color(0xFF225B7B),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'start-end date', //${widget.startDate} - ${widget.endDate}',
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
                                            blurRadius:
                                                2, // Adjust for desired blur amount
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 4),
                                          Text(
                                            'much room and people', //1 Room, ${widget.adultValue} Adult, ${widget.childValue} Children',
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
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 2),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
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
                                    borderRadius: BorderRadius.circular(6)),
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 226),
                                  margin: const EdgeInsets.all(14),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              activeColor:
                                                  const Color(0xFF225B7B),
                                              value: bookOption[0],
                                              selected: false,
                                              groupValue: bookSelectedOption,
                                              onChanged: (value) {
                                                setState(() {
                                                  bookSelectedOption =
                                                      value.toString();
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
                                              activeColor:
                                                  const Color(0xFF225B7B),
                                              value: bookOption[1],
                                              groupValue: bookSelectedOption,
                                              onChanged: (value) {
                                                setState(() {
                                                  bookSelectedOption =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 6.0, right: 6, top: 12),
                                        child: Divider(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Form(
                                          key: userbookform,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                initialValue: email,
                                                decoration: InputDecoration(
                                                  labelText: 'Email Address',
                                                  hintText: 'email',
                                                  hintStyle:
                                                      GoogleFonts.montserrat(
                                                    textStyle: const TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.4,
                                                    ),
                                                  ),
                                                  labelStyle:
                                                      GoogleFonts.montserrat(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xFF225B7B),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                          .hasMatch(value)) {
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
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 6.0,
                                                              top: 32),
                                                      child: DropdownButton<
                                                          String>(
                                                        items: const [
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: 'Mr.',
                                                            child: Text('Mr.'),
                                                          ),
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: 'Mrs.',
                                                            child: Text('Mrs.'),
                                                          ),
                                                        ],
                                                        onChanged:
                                                            (String? value) {
                                                          setState(() {
                                                            gendervalue = value
                                                                .toString();
                                                          });
                                                        },
                                                        hint: Text(
                                                          gendervalue,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            textStyle:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              letterSpacing:
                                                                  -0.4,
                                                            ),
                                                          ),
                                                        ),
                                                        underline: Container(
                                                          height: 1,
                                                          color: const Color(
                                                              0xFF225B7B),
                                                        ),
                                                        icon: const Icon(
                                                          Icons
                                                              .arrow_drop_down_rounded,
                                                          color:
                                                              Color(0xFF225B7B),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 8),
                                                      child: TextFormField(
                                                        initialValue:
                                                            _firstname,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'First Name',
                                                          labelStyle:
                                                              GoogleFonts
                                                                  .montserrat(
                                                            textStyle:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFF225B7B),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              letterSpacing:
                                                                  -0.4,
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
                                                                  .hasMatch(
                                                                      value)) {
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
                                                      initialValue: lastname,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Last Name',
                                                        labelStyle: GoogleFonts
                                                            .montserrat(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF225B7B),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                                .hasMatch(
                                                                    value)) {
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
                                                initialValue: number,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText: 'Phone Number',
                                                  labelStyle:
                                                      GoogleFonts.montserrat(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xFF225B7B),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                              ),
                                              TextFormField(
                                                initialValue: address,
                                                decoration: InputDecoration(
                                                  labelText: 'City of Origin',
                                                  labelStyle:
                                                      GoogleFonts.montserrat(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xFF225B7B),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                          .hasMatch(value)) {
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
                                        spreadRadius:
                                            2, // Adjust for desired shadow spread
                                        blurRadius:
                                            2, // Adjust for desired blur amount
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(6)),
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 226),
                                  margin: const EdgeInsets.all(14),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.4,
                                                    ),
                                                  ),
                                                ),
                                                activeColor:
                                                    const Color(0xFF225B7B),
                                                value: paymentOption[0],
                                                selected: false,
                                                groupValue: paySelectedOption,
                                                onChanged: (value) {
                                                  setState(() {
                                                    paySelectedOption =
                                                        value.toString();
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: -0.4,
                                                    ),
                                                  ),
                                                ),
                                                activeColor:
                                                    const Color(0xFF225B7B),
                                                value: paymentOption[1],
                                                groupValue: paySelectedOption,
                                                onChanged: (value) {
                                                  setState(() {
                                                    paySelectedOption =
                                                        value.toString();
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
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(context, ReschedulePage.routeName);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(double.infinity, 52),
                                    elevation: 2,
                                    backgroundColor: const Color(0xFF225B7B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12.0), // Adjust as needed
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "harga total", //${widget.hargaTotal}",
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
                          )
                        : Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 12, left: 20, right: 20),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
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
                                    borderRadius: BorderRadius.circular(6)),
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 226),
                                  margin: const EdgeInsets.all(14),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Reason of Cancellation',
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
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter reason here...',
                                                hintStyle:
                                                    GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: -0.4,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF225B7B),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.black38,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              minLines: 3,
                                              maxLines: 7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
            rescheduleVis
                ? Container()
                : Positioned(
                    bottom: 12,
                    left: 1,
                    right: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, ReschedulePage.routeName);
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cancel Book",
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
                  ),
          ],
        )
        // : Text('Data tidak ditemukan'),
        );
  }

  Future<void> fetchUserData() async {
    var user = FirebaseAuth.instance.currentUser;

    // Pastikan user sudah login
    if (user == null) {
      // Jika user belum login, tampilkan pesan
      print("Silakan login terlebih dahulu");
      return; // Keluar dari metode fetchUserData
    }

    var url =
        Uri.parse("https://projekta.seculab.space/crudtaprojek/view_data.php");
    String uid = user.uid;

    var response = await http.post(url, body: {
      "uid": uid,
    });

    var data = json.decode(response.body);
    if (data != null) {
      // Data berhasil diterima, tampilkan firstname dan lastname
      _firstname = data['firstname'];
      lastname = data['lastname'];
      number = data['number'];
      birthdate = data['birthdate'];
      address = data['address'];
      email = data['email'];
      print('Firstname: $_firstname, Lastname: $lastname');
      // Lakukan apapun yang Anda ingin lakukan dengan data ini
    } else {
      print("Gagal mendapatkan data pengguna");
    }

    if (_firstname != null) {
      firstnameTrigger = true;
    }
  }
}
