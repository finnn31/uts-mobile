import 'package:flutter/material.dart';
import 'home_page.dart';

class SpeedConversionPage extends StatefulWidget {
  @override
  _SpeedConversionPageState createState() => _SpeedConversionPageState();
}

class _SpeedConversionPageState extends State<SpeedConversionPage> {
  double _input = 0;
  double _output = 0;

  void _convertToKmh() {
    setState(() {
      _output = _input * 3.6; // Konversi m/s ke km/h
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konversi Kecepatan")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Masukkan kecepatan dalam m/s"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _input = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertToKmh,
              child: Text("Konversi ke km/h"),
            ),
            SizedBox(height: 20),
            Text("Hasil: $_output km/h"),
          ],
        ),
      ),
    );
  }
}
