import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSetting extends StatefulWidget {
  static const String routeName = '/profile-setting';
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final _formKey = GlobalKey<FormState>();
  late String _name = "";
  late String _number = "";
  late String _birth = "";
  late String _address = "";
  String? _firstname;
  String? lastname;
  String? number;
  String? birthdate;
  String? address;
  String? email;
  bool firstnameTrigger = false;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await fetchUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Center(child: Text('Profile Settings')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: Color(0x00ffffff),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200, // Sesuaikan dengan tinggi gambar profil Anda
                  color: Colors.lightBlue[600],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Row(
                        children: [
                          Container(
                            height: 124,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: const AspectRatio(
                                      aspectRatio:
                                          1.0, // 1:1 aspect ratio (square)
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/john.jpg'),
                                        fit:
                                            BoxFit.cover, // Fills the container
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 18),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${_firstname ?? 'Loading...'}',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        '${email ?? 'Loading...'}',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: Colors.white54,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 32),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Color(0xFFF8F8F8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: firstnameTrigger!
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 18),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          initialValue: _firstname,
                                          decoration: const InputDecoration(
                                              labelText: "Name"),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter your name";
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            if (value != null) {
                                              _name = value;
                                            }
                                          },
                                        ),
                                        TextFormField(
                                          initialValue: number,
                                          decoration: const InputDecoration(
                                            labelText: "Number",
                                          ),
                                          keyboardType: TextInputType.phone,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter your number";
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            if (value != null) {
                                              _number = value;
                                            }
                                          },
                                        ),
                                        TextFormField(
                                          initialValue: birthdate,
                                          decoration: const InputDecoration(
                                              labelText: "Birth Date"),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter your birth";
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            if (value != null) {
                                              _birth = value;
                                            }
                                          },
                                        ),
                                        TextFormField(
                                          initialValue: address,
                                          decoration: const InputDecoration(
                                              labelText: "Address"),
                                          maxLines:
                                              null, // This allows for multi-line input
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              // Tambahkan pemeriksaan null
                                              return "Please enter your address";
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            if (value != null) {
                                              // Tambahkan pemeriksaan null
                                              _address = value;
                                            }
                                          },
                                        ),
                                        const SizedBox(height: 26),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Colors.blue,
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              _formKey.currentState?.save();
                                              // Proses data formulir di sini
                                            }
                                          },
                                          child: Text(
                                            'Save Profile',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
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
        Uri.parse("http://192.168.1.8/ta_projek/crudtaprojek/view_data.php");
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
