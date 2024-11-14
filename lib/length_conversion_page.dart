import 'package:flutter/material.dart';

class LengthConversionPage extends StatefulWidget {
  @override
  _LengthConversionPageState createState() => _LengthConversionPageState();
}

class _LengthConversionPageState extends State<LengthConversionPage> {
  final List<String> lengthUnits = ['Meter', 'Kilometer', 'Centimeter', 'Inch'];
  String selectedFromUnit = 'Meter';
  String selectedToUnit = 'Centimeter';

  TextEditingController lengthController = TextEditingController();
  double? result;

  void convertLength() {
    double inputLength = double.tryParse(lengthController.text) ?? 0.0;
    double convertedLength = inputLength;

    // Logika konversi panjang
    if (selectedFromUnit == 'Meter') {
      if (selectedToUnit == 'Kilometer') convertedLength = inputLength / 1000;
      if (selectedToUnit == 'Centimeter') convertedLength = inputLength * 100;
      if (selectedToUnit == 'Inch') convertedLength = inputLength * 39.3701;
    } else if (selectedFromUnit == 'Kilometer') {
      if (selectedToUnit == 'Meter') convertedLength = inputLength * 1000;
      if (selectedToUnit == 'Centimeter') convertedLength = inputLength * 100000;
      if (selectedToUnit == 'Inch') convertedLength = inputLength * 39370.1;
    } else if (selectedFromUnit == 'Centimeter') {
      if (selectedToUnit == 'Meter') convertedLength = inputLength / 100;
      if (selectedToUnit == 'Kilometer') convertedLength = inputLength / 100000;
      if (selectedToUnit == 'Inch') convertedLength = inputLength * 0.393701;
    } else if (selectedFromUnit == 'Inch') {
      if (selectedToUnit == 'Meter') convertedLength = inputLength * 0.0254;
      if (selectedToUnit == 'Kilometer') convertedLength = inputLength * 0.0000254;
      if (selectedToUnit == 'Centimeter') convertedLength = inputLength * 2.54;
    }

    setState(() {
      result = convertedLength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Panjang'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: lengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Panjang',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedFromUnit,
              items: lengthUnits.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFromUnit = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedToUnit,
              items: lengthUnits.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedToUnit = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertLength,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            result != null
                ? Text(
              'Hasil: $result $selectedToUnit',
              style: TextStyle(fontSize: 20),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
