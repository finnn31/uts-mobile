import 'package:flutter/material.dart';
import 'splashscreen.dart'; // Import splashscreen.dart
import 'login_screen.dart'; // Import login_screen.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Ubah halaman awal menjadi SplashScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
