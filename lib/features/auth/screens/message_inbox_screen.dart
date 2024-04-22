import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageInboxScreen extends StatefulWidget {
  static const String routeName = '/message-inbox-screen';
  const MessageInboxScreen({super.key});

  @override
  State<MessageInboxScreen> createState() => _MessageInboxScreenState();
}

class _MessageInboxScreenState extends State<MessageInboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          title: Text(
            'Orchid House\'s Owner',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.6,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
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
                  Color(0xFFD2E9FF), // Warna gradient awal
                  Color(0xFFFFFFFF), // Warna gradient akhir
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.black38,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.4,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(4.0),
                    hintText: 'Type Message...',
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
