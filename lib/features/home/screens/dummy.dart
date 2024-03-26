import 'package:flutter/material.dart';

class SearchBarExample extends StatefulWidget {
  @override
  _SearchBarExampleState createState() => _SearchBarExampleState();
}

class _SearchBarExampleState extends State<SearchBarExample> {
  static const String routeName = '/dummy';
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Home Screen'), // Ganti dengan tampilan halaman utama Anda
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
            'Search Results'), // Ganti dengan tampilan hasil pencarian Anda
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchBarExample(),
  ));
}
