import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Page with Containers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollablePage(),
    );
  }
}

class ScrollablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable Page'),
      ),
      body: ListView.builder(
        itemCount: 20, // Ganti dengan jumlah item yang Anda inginkan
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8.0), // Atur margin jika diperlukan
            padding: const EdgeInsets.all(16.0), // Atur padding jika diperlukan
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              'Item $index',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        },
      ),
    );
  }
}
