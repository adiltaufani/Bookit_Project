import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/screens/home_screen.dart';
import 'package:flutter_project/features/auth/widgets/top_home_btn.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search-page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isTextFieldFocused = false;
  TextEditingController _searchController = TextEditingController();

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
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: _searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.all(4.0),
                  hintText: 'Search..',
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                  hintMaxLines: 1,
                ),
                onTap: () {
                  setState(() {
                    isTextFieldFocused = true;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    isTextFieldFocused = value.isNotEmpty;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    isTextFieldFocused = false;
                  });
                },
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              padding: const EdgeInsets.only(right: 12),
              icon: const Icon(
                Icons.close,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search for',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF757575),
                          ),
                        ),
                        Text(
                          'Jakarta',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/bookit.png',
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2.0),
              const TopHomeBtn(),
              const SizedBox(height: 4.0),
              const Divider(
                color: Colors.black12, // Warna garis sesuai kebutuhan
                thickness: 1, // Ketebalan garis sesuai kebutuhan
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(3, 2, 4, 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/sort.png',
                        height: 34,
                      ),
                    ),
                    // Image.asset(
                    //   'assets/images/sort.png',
                    //   height: 34,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sort by',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontSize: 10),
                          ),
                        ),
                        Text(
                          'Popularity',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            color: Color(0xFF0A8ED9),
                            width: 1.2,
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.minPositive, 34)),
                        maximumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 34),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5), // Mengatur kelengkungan sudut di sini
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Color(0xFF0A8ED9),
                            size: 18,
                          ), // Ikon di sebelah kiri
                          const SizedBox(
                              width: 8), // Spacer antara ikon dan teks
                          Text(
                            '01 Jan..',
                            style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                color: Color(0xFF0A8ED9),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              color: Color(0xFF0A8ED9),
                              width: 1.2,
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(80, 34)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Mengatur kelengkungan sudut di sini
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.group,
                              color: Color(0xFF0A8ED9),
                              size: 18,
                            ), // Ikon di sebelah kiri
                            const SizedBox(
                                width: 8), // Spacer antara ikon dan teks
                            Text(
                              '2 Adult..',
                              style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                  color: Color(0xFF0A8ED9),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.black12, // Warna garis sesuai kebutuhan
                thickness: 1, // Ketebalan garis sesuai kebutuhan
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/contoh2.png',
                      height: 68.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Orchad House',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.6,
                              ),
                            ),
                          ),
                          Text(
                            'Rp.1.500.000.000/Year',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color(0xFF182C74),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.6,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jl. Sultan Iskandar Muda',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Color(0xFF858585),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
