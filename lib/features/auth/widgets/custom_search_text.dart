import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/widgets/top_home_btn.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchText extends StatefulWidget {
  const CustomSearchText({super.key});

  @override
  State<CustomSearchText> createState() => _CustomSearchTextState();
}

class _CustomSearchTextState extends State<CustomSearchText> {
  final focusNode = FocusNode();
  bool isTextFieldFocused = false;
  late TextEditingController _searchController;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
    WidgetsBinding.instance!.addPostFrameCallback((_) => hideOverlay());

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        top: offset.dy + size.height + 8,
        child: buildOverlay(),
      ),
    );

    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  Widget buildOverlay() => Material(
        elevation: 8,
        child: Column(
          children: <Widget>[
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
                        const SizedBox(width: 8), // Spacer antara ikon dan teks
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
            ListTile(
              leading: Image.network(
                'https://i.pinimg.com/originals/23/0b/d6/230bd68b82543a4e1554a94346b84f3a.jpg',
                fit: BoxFit.cover,
              ),
              title: Text('Villa D.Paragon'),
              subtitle: Text('Rp. 1.500.000 / year \n Jl. iskandar muda barat'),
              onTap: () {
                _searchController.text = 'Villa D.Paragon';

                hideOverlay();
                focusNode.unfocus();
              },
            ),
            ListTile(
              leading: Image.network(
                'https://www.baranselvillas.com/property-images/thumbnail_lg/371/villa-harmony-f295bbd72e.JPG',
                fit: BoxFit.cover,
              ),
              title: Text('Villa Ujung Pandang'),
              subtitle: Text(
                  'Rp. 20.000.000 / year \n Jl. Telekomuinikasi barat daya'),
              onTap: () {
                _searchController.text = 'Villa Ujung Pandang';

                hideOverlay();
                focusNode.unfocus();
              },
            ),
            ListTile(
              leading: Image.network(
                'https://www.thetopvillas.com/blog/wp-content/uploads/2020/11/rsz_157658394535972bbfb9774708d83ff0ef_2-2.jpg',
                fit: BoxFit.cover,
              ),
              title: Text('Villa Puntang Indah'),
              subtitle: Text('Jl, gn puntang malabar barat'),
              onTap: () {
                _searchController.text = 'Villa Puntang Indah';

                hideOverlay();
                focusNode.unfocus();
              },
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.top,
      controller: _searchController,
      decoration: InputDecoration(
        prefixIcon: isTextFieldFocused || _searchController.text.isNotEmpty
            ? null
            : const Icon(
                Icons.search,
                color: Colors.grey,
              ),
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.all(4.0),
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
    );
  }
}
