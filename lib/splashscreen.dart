import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart'; // Pastikan login_screen.dart diimpor

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk delay splash screen selama 5 detik
    Timer(Duration(seconds: 5), () {
      // Navigasi ke halaman utama (Dashboard) setelah 5 detik
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar profil
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/IMG_1093.jpg'), // Ganti dengan path gambar Anda
            ),
            SizedBox(height: 20),
            // Nama aplikasi
            Text(
              'Finnn', // Ganti dengan nama aplikasi Anda
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Nama dan NIM
            Text(
              'Mohammad Hafizi', // Ganti dengan nama Anda
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '152022154', // Ganti dengan NIM Anda
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

