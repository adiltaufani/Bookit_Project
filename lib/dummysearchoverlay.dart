import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HotelFilterPage extends StatefulWidget {
  @override
  _HotelFilterPageState createState() => _HotelFilterPageState();
}

class _HotelFilterPageState extends State<HotelFilterPage> {
  int? hargaMin;
  int? hargaMax;
  int? bintang;
  bool? wifi;
  bool? kolamRenang;
  bool? parkir;
  bool? restoran;
  bool? gym;
  bool? resepsionis24jam;
  late List<Hotel> hotels; // Mengubah ke List<Hotel> yang tidak diinisialisasi

  @override
  void initState() {
    super.initState();
    hotels =
        []; // Menginisialisasi hotels sebagai list kosong saat inisialisasi
    _loadHotels();
    print(
        'ini otel ${hotels}'); // Memuat data hotel pertama kali halaman dimuat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Hotel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Implementasi filter dan tombol terapkan filter
            TextFormField(
              decoration: InputDecoration(labelText: 'Harga Min'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  hargaMin = int.tryParse(value);
                });
              },
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: 'Harga Max'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  hargaMax = int.tryParse(value);
                });
              },
            ),
            SizedBox(height: 8),
            TextFormField(
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
            SizedBox(height: 16),
            // ListView untuk menampilkan daftar hotel
            Expanded(
              child: ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(hotels[index].nama),
                    subtitle: Text('Harga: ${hotels[index].harga}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchHotels({
    int? hargaMin,
    int? hargaMax,
    int? bintang,
    bool? wifi,
    bool? kolamRenang,
    bool? parkir, // Properti baru untuk parkir
    bool? restoran, // Properti baru untuk restoran
    bool? pusatKebugaran, // Properti baru untuk pusat kebugaran
    bool? resepsionis24Jam, // Properti baru untuk resepsionis 24 jam
  }) async {
    final url = Uri.parse(
        'http://172.20.10.6/ta_projek/crudtaprojek/read.php?'); // Ganti dengan URL API Anda

    Map<String, dynamic> queryParams = {};
    if (hargaMin != null) queryParams['harga_min'] = hargaMin.toString();
    if (hargaMax != null) queryParams['harga_max'] = hargaMax.toString();
    if (bintang != null) queryParams['bintang'] = bintang.toString();
    if (wifi == true) queryParams['wifi'] = '1';
    if (kolamRenang == true) queryParams['kolam_renang'] = '1';
    if (parkir == true)
      queryParams['parkir'] = '1'; // Query parameter untuk parkir
    if (restoran == true)
      queryParams['restoran'] = '1'; // Query parameter untuk restoran
    if (pusatKebugaran == true)
      queryParams['pusat_kebugaran'] =
          '1'; // Query parameter untuk pusat kebugaran
    if (resepsionis24Jam == true)
      queryParams['resepsionis_24_jam'] =
          '1'; // Query parameter untuk resepsionis 24 jam

    final urlWithParams = url.replace(queryParameters: queryParams);

    final response = await http.get(urlWithParams);
    print(urlWithParams);

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> data = json.decode(response.body);
      setState(() {
        hotels = data.map((json) => Hotel.fromJson(json)).toList();
      });
    } else {
      setState(() {
        hotels.clear();
      });
      throw Exception('Failed to load hotels');
    }
  }

  Future<void> _loadHotels() async {
    try {
      await fetchHotels(
        hargaMin: hargaMin,
        hargaMax: hargaMax,
        bintang: bintang,
        wifi: wifi,
        kolamRenang: kolamRenang,
        parkir: parkir,
        restoran: restoran,
        pusatKebugaran: gym,
        resepsionis24Jam: resepsionis24jam,
      );
      print('try load berhasil');
    } catch (e) {
      print(e);
      // Handle error
    }
  }
}

class Hotel {
  final int id;
  final String nama;
  final double harga;
  final int bintang;
  final bool wifi;
  final bool kolamRenang;
  final bool parkir; // Properti baru untuk parkir
  final bool restoran; // Properti baru untuk restoran
  final bool pusatKebugaran; // Properti baru untuk pusat kebugaran
  final bool resepsionis24Jam; // Properti baru untuk resepsionis 24 jam

  Hotel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.bintang,
    required this.wifi,
    required this.kolamRenang,
    required this.parkir, // Properti baru
    required this.restoran, // Properti baru
    required this.pusatKebugaran, // Properti baru
    required this.resepsionis24Jam, // Properti baru
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: int.parse(json['id']),
      nama: json['nama'],
      harga: double.parse(json['harga']),
      bintang: int.parse(json['bintang']),
      wifi: json['wifi'] == '1',
      kolamRenang: json['kolam_renang'] == '1',
      parkir: json['parkir'] == '1', // Konversi 1/0 ke bool untuk parkir
      restoran: json['restoran'] == '1', // Konversi 1/0 ke bool untuk restoran
      pusatKebugaran: json['pusat_kebugaran'] ==
          '1', // Konversi 1/0 ke bool untuk pusat kebugaran
      resepsionis24Jam: json['resepsionis_24_jam'] ==
          '1', // Konversi 1/0 ke bool untuk resepsionis 24 jam
    );
  }
}
