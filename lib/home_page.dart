import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'page_profile.dart';
import 'page_shop.dart';
import 'temperature_conversion_page.dart'; // Buat halaman ini
import 'basic_calculator_page.dart'; // Buat halaman ini
import 'speed_conversion_page.dart'; // Buat halaman ini
import 'weight_conversion_page.dart'; // Buat halaman ini
import 'length_conversion_page.dart'; // Buat halaman ini
import 'number_system_conversion_page.dart'; // Buat halaman ini

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: Text(
          'Beranda',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Kembali ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Selamat Datang di Beranda',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  // Tombol untuk Konversi Suhu
                  _buildMenuButton(
                    context,
                    icon: Icons.thermostat,
                    label: 'Suhu',
                    page: TemperatureConversionPage(),
                  ),
                  // Tombol untuk Kalkulator
                  _buildMenuButton(
                    context,
                    icon: Icons.calculate,
                    label: 'Kalkulator',
                    page: BasicCalculatorPage(),
                  ),
                  // Tombol untuk Konversi Kecepatan
                  _buildMenuButton(
                    context,
                    icon: Icons.speed,
                    label: 'Kecepatan',
                    page: SpeedConversionPage(),
                  ),
                  // Tombol untuk Konversi Berat
                  _buildMenuButton(
                    context,
                    icon: Icons.fitness_center,
                    label: 'Berat',
                    page: WeightConversionPage(),
                  ),
                  // Tombol untuk Konversi Panjang
                  _buildMenuButton(
                    context,
                    icon: Icons.straighten,
                    label: 'Panjang',
                    page: LengthConversionPage(),
                  ),
                  // Tombol untuk Sistem Bilangan
                  _buildMenuButton(
                    context,
                    icon: Icons.code,
                    label: 'Bilangan',
                    page: NumberSystemConversionPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, size: 30),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat tombol dengan ikon dan teks
  Widget _buildMenuButton(BuildContext context, {required IconData icon, required String label, required Widget page}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.black),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
