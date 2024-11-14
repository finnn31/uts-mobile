import 'package:flutter/material.dart';
import 'home_page.dart'; 

class TemperatureConversionPage extends StatefulWidget {
  @override
  _TemperatureConversionPageState createState() => _TemperatureConversionPageState();
}

class _TemperatureConversionPageState extends State<TemperatureConversionPage> {
  double _input = 0;
  double _output = 0;

  void _convertToFahrenheit() {
    setState(() {
      _output = (_input * 9/5) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konversi Suhu")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Masukkan suhu dalam Celsius"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _input = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertToFahrenheit,
              child: Text("Konversi ke Fahrenheit"),
            ),
            SizedBox(height: 20),
            Text("Hasil: $_output °F"),
          ],
        ),
      ),
    );
  }
}
