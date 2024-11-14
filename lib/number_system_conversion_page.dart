import 'package:flutter/material.dart';

class NumberSystemConversionPage extends StatefulWidget {
  @override
  _NumberSystemConversionPageState createState() => _NumberSystemConversionPageState();
}

class _NumberSystemConversionPageState extends State<NumberSystemConversionPage> {
  final List<String> numberSystems = ['Biner', 'Oktal', 'Desimal', 'Hexa'];
  String selectedFromSystem = 'Desimal';
  String selectedToSystem = 'Biner';

  TextEditingController numberController = TextEditingController();
  String? result;

  // Fungsi untuk konversi sistem bilangan
  void convertNumberSystem() {
    int inputNumber = int.tryParse(numberController.text) ?? 0;
    String convertedNumber = numberController.text;

    if (selectedFromSystem == 'Desimal') {
      if (selectedToSystem == 'Biner') convertedNumber = inputNumber.toRadixString(2);
      if (selectedToSystem == 'Oktal') convertedNumber = inputNumber.toRadixString(8);
      if (selectedToSystem == 'Hexa') convertedNumber = inputNumber.toRadixString(16).toUpperCase();
    } else if (selectedFromSystem == 'Biner') {
      int decimal = int.parse(numberController.text, radix: 2);
      if (selectedToSystem == 'Desimal') convertedNumber = decimal.toString();
      if (selectedToSystem == 'Oktal') convertedNumber = decimal.toRadixString(8);
      if (selectedToSystem == 'Hexa') convertedNumber = decimal.toRadixString(16).toUpperCase();
    } else if (selectedFromSystem == 'Oktal') {
      int decimal = int.parse(numberController.text, radix: 8);
      if (selectedToSystem == 'Desimal') convertedNumber = decimal.toString();
      if (selectedToSystem == 'Biner') convertedNumber = decimal.toRadixString(2);
      if (selectedToSystem == 'Hexa') convertedNumber = decimal.toRadixString(16).toUpperCase();
    } else if (selectedFromSystem == 'Hexa') {
      int decimal = int.parse(numberController.text, radix: 16);
      if (selectedToSystem == 'Desimal') convertedNumber = decimal.toString();
      if (selectedToSystem == 'Biner') convertedNumber = decimal.toRadixString(2);
      if (selectedToSystem == 'Oktal') convertedNumber = decimal.toRadixString(8);
    }

    setState(() {
      result = convertedNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Sistem Bilangan'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedFromSystem,
              items: numberSystems.map((String system) {
                return DropdownMenuItem<String>(
                  value: system,
                  child: Text(system),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFromSystem = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedToSystem,
              items: numberSystems.map((String system) {
                return DropdownMenuItem<String>(
                  value: system,
                  child: Text(system),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedToSystem = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertNumberSystem,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            result != null
                ? Text(
              'Hasil: $result',
              style: TextStyle(fontSize: 20),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
