import 'package:flutter/material.dart';
import 'home_page.dart';

class BasicCalculatorPage extends StatefulWidget {
  @override
  _BasicCalculatorPageState createState() => _BasicCalculatorPageState();
}

class _BasicCalculatorPageState extends State<BasicCalculatorPage> {
  double _num1 = 0;
  double _num2 = 0;
  double _result = 0;

  void _calculate(String operator) {
    setState(() {
      if (operator == '+') _result = _num1 + _num2;
      if (operator == '-') _result = _num1 - _num2;
      if (operator == '*') _result = _num1 * _num2;
      if (operator == '/') _result = _num2 != 0 ? _num1 / _num2 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator Biasa")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Angka 1"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _num1 = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Angka 2"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _num2 = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['+', '-', '*', '/'].map((op) {
                return ElevatedButton(
                  onPressed: () => _calculate(op),
                  child: Text(op),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text("Hasil: $_result"),
          ],
        ),
      ),
    );
  }
}
