import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/screens/home_screen.dart';
import 'package:flutter_project/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const HomeScreen(),
    );
  }
}
