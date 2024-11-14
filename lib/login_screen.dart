import 'package:flutter/material.dart';
import 'home_page.dart';
import 'signup_page.dart'; // Import halaman SignUpPage

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        // Ganti dengan gambar logo Anda
                        Image.asset(
                          'assets/images/logos.png', // Pastikan jalur ini benar
                          height: 300, // Ukuran logo diperbesar
                          width: 300, // Ukuran logo diperbesar
                        ),
                      ],
                    ),
                  ),
                  // Input Email
                  _buildTextField(
                    controller: emailController,
                    label: 'Email',
                    placeholder: 'Masukkan email Anda',
                    obscureText: false,
                  ),
                  SizedBox(height: 16),
                  // Input Password
                  _buildTextField(
                    controller: passwordController,
                    label: 'Password',
                    placeholder: 'Masukkan password',
                    obscureText: true,
                  ),
                  SizedBox(height: 24),
                  // Tombol Login
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Tombol untuk navigasi ke Sign Up
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'Buat akun baru?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String placeholder,
    required bool obscureText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
