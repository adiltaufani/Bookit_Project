import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/appbar_global.dart';
import 'package:flutter_project/features/auth/services/auth/google_auth_service.dart';
import 'package:flutter_project/features/notification/database/db_helper.dart';
import 'package:flutter_project/features/notification/model/notification_model.dart';
import 'package:flutter_project/features/profile/screens/setting_page.dart';
import 'package:flutter_project/features/auth/widgets/side_menu.dart';
import 'package:flutter_project/features/search/widgets/search_page_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  static const String routeName = '/notification-page';
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GoogleAuthService authService = GoogleAuthService();
  List<NotifModel> _notifications = [];
  bool isTextFieldFocused = false;
  bool _isDataAvail = false;
  List<bool> booleanList = List<bool>.filled(10, false);
  List<bool> isUp = List<bool>.filled(10, false);
  List<bool> isConstScrolled = List<bool>.filled(10, false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _toggleImage(int index) {
    setState(() {
      isUp[index] = !isUp[index];

      if (!booleanList[index]) {
        isConstScrolled[index] = !isConstScrolled[index];
        Timer(const Duration(milliseconds: 200), () {
          _textvis(index);
        });
      } else {
        booleanList[index] = !booleanList[index];
        Timer(const Duration(milliseconds: 0), () {
          _constvis(index);
        });
      }
    });
  }

  void _textvis(int index) {
    setState(() {
      booleanList[index] = !booleanList[index];
    });
  }

  void _constvis(int index) {
    setState(() {
      isConstScrolled[index] = !isConstScrolled[index];
    });
  }

  @override
  void initState() {
    _fetchNotifications();
    super.initState();
  }

  Future<void> _fetchNotifications() async {
    var user = FirebaseAuth.instance.currentUser;

    // Pastikan user sudah login
    if (user == null) {
      // Jika user belum login, tampilkan pesan
      return; // Keluar dari metode fetchUserData
    }
    String user_uid = user.uid;
    List<NotifModel> notifications =
        await NotificationDatabaseHelper.getNotifications(user_uid);
    setState(() {
      _notifications = notifications;
    });
    if (_notifications.isNotEmpty) {
      _isDataAvail = true;
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Notifications'),
  //     ),
  //     body: ListView.builder(
  //       itemCount: _notifications.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           title: Text(_notifications[index].title),
  //           subtitle: Text(_notifications[index].body),
  //           trailing: Text(_notifications[index].time.toString()),
  //         );
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      drawerScrimColor: Colors.black38,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SearchPageWidget.routeName);
            },
            child: Container(
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.black26,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Search..',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, NotificationPage.routeName);
              },
              icon: Image.asset(
                'assets/images/notification.png',
                height: 34.0,
              ),
            ),
            FutureBuilder<String?>(
                future: ProfileDataManager.getProfilePic(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SettingPage.routeName);
                      },
                      icon: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white30,
                        backgroundImage: NetworkImage(snapshot.data!),
                      ),
                    );
                  } else {
                    return Text('no data');
                  }
                }),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD2E9FF), // Warna gradient awal
              Color(0xFFFFFFFF), // Warna gradient akhir
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/bookit.png',
                    height: 24,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 10, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Untuk mengatur jarak antara teks dan ikon
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/notif_black.png',
                        height: 30,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Notification',
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 28,
                    ),
                    onPressed: () async {
                      await NotificationDatabaseHelper.deleteAllNotifications();
                      setState(() {
                        _isDataAvail = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            _isDataAvail
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _notifications.length,
                      itemBuilder: (BuildContext context, int index) {
                        String formattedDate = _notifications[index]
                            .time
                            .toIso8601String()
                            .substring(0, 10);
                        DateTime date = DateTime.parse(formattedDate);
                        String realDate =
                            DateFormat('dd MMMM yyyy').format(date);
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    height: isConstScrolled[index] ? 216 : 106,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                20, 20, 10, 10),
                                            child: Image.asset(
                                                'assets/images/mail.png')),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              3, 20, 8, 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      booleanList[index]
                                                          ? Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                      maxWidth:
                                                                          220),
                                                              child: Text(
                                                                _notifications[
                                                                        index]
                                                                    .title,
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    letterSpacing:
                                                                        -0.6,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                      maxWidth:
                                                                          220),
                                                              child: Text(
                                                                _notifications[
                                                                        index]
                                                                    .title,
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    letterSpacing:
                                                                        -0.6,
                                                                  ),
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {});
                                                        },
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      8.0),
                                                          child:
                                                              AnimatedSwitcher(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  child: booleanList[
                                                                          index]
                                                                      ? Container(
                                                                          constraints:
                                                                              const BoxConstraints(maxWidth: 220),
                                                                          child:
                                                                              Text(
                                                                            _notifications[index].body,
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              textStyle: const TextStyle(
                                                                                color: Colors.black54,
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.w500,
                                                                                letterSpacing: -0.6,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : const SizedBox() // or use a Container with a very small height
                                                                  ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 2),
                                                        constraints:
                                                            const BoxConstraints(
                                                                maxWidth: 240),
                                                        child: Text(
                                                          "Booking ID ${_notifications[index].id}",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            textStyle:
                                                                const TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              letterSpacing:
                                                                  -0.6,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 20),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 12,
                                    bottom: 8,
                                    child: Text(
                                      '${realDate}',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.6,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 12,
                                    top: 20,
                                    child: InkWell(
                                      onTap: () {
                                        _toggleImage(index);
                                      },
                                      borderRadius: BorderRadius.circular(
                                          8), // Adjust the border radius as needed
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            8.0), // Adjust the padding as needed
                                        child: AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: isUp[index]
                                              ? Image.asset(
                                                  'assets/images/arrow_up.png',
                                                  height: 10,
                                                  key: UniqueKey(),
                                                )
                                              : Image.asset(
                                                  'assets/images/arrow_down.png',
                                                  height: 10,
                                                  key: UniqueKey(),
                                                ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Container(
                    child: Text('kamu belum memiliki pesan'),
                  ),
          ],
        ),
      ),
    );
  }
}
