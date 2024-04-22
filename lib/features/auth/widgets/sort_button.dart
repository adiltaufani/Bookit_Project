import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/common/widgets/custom_texfield.dart';
import 'package:flutter_project/features/auth/screens/search_page.dart';

class SortButton extends StatefulWidget {
  String namaKota;
  String? tanggal_checkin;
  String? tanggal_checkout;
  int? hargaMin;
  int? hargaMax;
  int? Bintang;
  bool? Wifi;
  bool? KolamRenang;
  bool? Parkir;
  bool? Restoran;
  bool? Gym;
  bool? Resepsionis_24_jam;
  SortButton({
    required this.namaKota,
    this.tanggal_checkin,
    this.tanggal_checkout,
    this.hargaMin,
    this.hargaMax,
    this.Bintang,
    this.Wifi,
    this.KolamRenang,
    this.Parkir,
    this.Restoran,
    this.Gym,
    this.Resepsionis_24_jam,
  });

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  int? _filterhargaAwal;
  int? _filterhargaAkhir;
  int? bintang;
  bool? wifi;
  bool? kolamRenang;
  bool? parkir;
  bool? restoran;
  bool? gym;
  bool? resepsionis24jam;
  TextEditingController _hargaMinController = TextEditingController();
  TextEditingController _hargaMaxController = TextEditingController();
  TextEditingController _bintangController = TextEditingController();
  final focusNode = FocusNode();
  OverlayEntry? entry;

  void showOverlay() {
    final overlay = Overlay.of(context);
    final size = MediaQuery.of(context).size; // Mendapatkan ukuran layar
    final overlayWidth = size.width * 0.8; // Lebar overlay
    final overlayHeight = size.height * 0.5; // Tinggi overlay

    entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Lapisan hitam semi-transparan
          Positioned.fill(
            child: GestureDetector(
              onTap:
                  hideOverlay, // Sembunyikan overlay saat lapisan hitam disentuh
              child: Container(
                color: Colors.black
                    .withOpacity(0.5), // Warna hitam semi-transparan
              ),
            ),
          ),
          // Overlay konten
          Positioned(
            width: overlayWidth,
            height: overlayHeight,
            left: (size.width - overlayWidth) /
                2, // Menempatkan di tengah horizontal
            top: (size.height - overlayHeight) /
                2, // Menempatkan di tengah vertikal
            child: buildOverlay(),
          ),
        ],
      ),
    );

    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => hideOverlay());
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
        print('overlay showed');
      }
    });

    if (widget.hargaMin != null) {
      _hargaMinController.text = widget.hargaMin.toString();
      _filterhargaAwal = widget.hargaMin;
    }
    if (widget.hargaMax != null) {
      _hargaMaxController.text = widget.hargaMax.toString();
      _filterhargaAkhir = widget.hargaMax;
    }
    if (widget.Bintang != null) {
      _bintangController.text = widget.Bintang.toString();
      bintang = widget.Bintang;
    }
    if (widget.Wifi != null) {
      wifi = widget.Wifi;
    }
    if (widget.KolamRenang != null) {
      kolamRenang = widget.KolamRenang;
    }
    if (widget.Parkir != null) {
      parkir = widget.Parkir;
    }
    if (widget.Restoran != null) {
      restoran = widget.Restoran;
    }
    if (widget.Gym != null) {
      gym = widget.Gym;
    }
    if (widget.Resepsionis_24_jam != null) {
      resepsionis24jam = widget.Resepsionis_24_jam;
    }
  }

  void dispose() {
    focusNode.dispose();
    _hargaMinController.dispose();
    _hargaMaxController.dispose();
    _bintangController.dispose();
    super.dispose();
  }

  Widget buildOverlay() => Material(
        elevation: 8,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.sizeOf(context).height,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _hargaMinController,
                          decoration: InputDecoration(labelText: 'Harga Min'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _filterhargaAwal = int.tryParse(value);
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _hargaMaxController,
                          decoration: InputDecoration(labelText: 'Harga Max'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _filterhargaAkhir = int.tryParse(value);
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _bintangController,
                          decoration: InputDecoration(labelText: 'Bintang'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              bintang = int.tryParse(value);
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        CheckboxListTile(
                          title: Text('Wifi'),
                          value: wifi ?? false,
                          onChanged: (value) {
                            setState(() {
                              wifi = value;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        CheckboxListTile(
                          title: Text('Kolam Renang'),
                          value: kolamRenang ?? false,
                          onChanged: (value) {
                            setState(() {
                              kolamRenang = value;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text('Parkir'),
                          value: parkir ?? false,
                          onChanged: (value) {
                            setState(() {
                              parkir = value;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text('Restoran'),
                          value: restoran ?? false,
                          onChanged: (value) {
                            setState(() {
                              restoran = value;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text('Gym'),
                          value: gym ?? false,
                          onChanged: (value) {
                            setState(() {
                              gym = value;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text('Resepsionis 24 jam'),
                          value: resepsionis24jam ?? false,
                          onChanged: (value) {
                            setState(() {
                              resepsionis24jam = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            _loadHotels(); // Panggil fungsi _loadHotels() saat tombol ditekan
                          },
                          child: Text('Terapkan Filter'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        focusNode: focusNode,
        onPressed: () {
          showOverlay();
        },
        icon: Image.asset(
          'assets/images/sort.png',
          height: 34,
        ),
      ),
    );
  }

  Future<void> _loadHotels() async {
    try {
      hideOverlay();
      focusNode.unfocus();
      await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SearchPage(
                namaKota: widget.namaKota,
                tanggal_checkin: widget.tanggal_checkin,
                tanggal_checkout: widget.tanggal_checkout,
                hargaAwal: _filterhargaAwal,
                hargaAkhir: _filterhargaAkhir,
                bintang: bintang,
                wifi: wifi,
                kolamRenang: kolamRenang,
                parkir: parkir,
                restoran: restoran,
                gym: gym,
                resepsionis24jam: resepsionis24jam,
              )));

      print('try load berhasil');
    } catch (e) {
      print(e);
      // Handle error
    }
  }
}
