import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({super.key});

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Column(
      children: [
        Align(
          child: TabBar(
            labelPadding: const EdgeInsets.only(left: 0, right: 40),
            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: CircleTabIndicator(color: Colors.blue, radius: 4),
            tabs: [
              Tab(
                child: Text(
                  'House',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Apartement',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Hotel',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Villa',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Resort',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: TabBarView(
            controller: tabController,
            children: [
              Column(
                children: [
                  const SizedBox(height: 5.0),
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
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
                ],
              ),
              const Text('asdasdda3'),
              const Text('asdasdda4'),
              const Text('asdasdda5'),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
