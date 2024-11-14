import 'package:flutter/material.dart';

class WeightConversionPage extends StatefulWidget {
  @override
  _WeightConversionPageState createState() => _WeightConversionPageState();
}

class _WeightConversionPageState extends State<WeightConversionPage> {
  // Daftar opsi unit berat
  final List<String> weightUnits = ['Kilogram', 'Gram', 'Pound', 'Ounce'];
  String selectedFromUnit = 'Kilogram';
  String selectedToUnit = 'Gram';

  // Kontroler untuk input nilai berat
  TextEditingController weightController = TextEditingController();

  // Variabel untuk menyimpan hasil konversi
  double? result;

  // Fungsi untuk melakukan konversi berat
  void convertWeight() {
    double inputWeight = double.tryParse(weightController.text) ?? 0.0;
    double convertedWeight = inputWeight;

    // Logika konversi
    if (selectedFromUnit == 'Kilogram') {
      if (selectedToUnit == 'Gram') convertedWeight = inputWeight * 1000;
      if (selectedToUnit == 'Pound') convertedWeight = inputWeight * 2.20462;
      if (selectedToUnit == 'Ounce') convertedWeight = inputWeight * 35.274;
    } else if (selectedFromUnit == 'Gram') {
      if (selectedToUnit == 'Kilogram') convertedWeight = inputWeight / 1000;
      if (selectedToUnit == 'Pound') convertedWeight = inputWeight * 0.00220462;
      if (selectedToUnit == 'Ounce') convertedWeight = inputWeight * 0.035274;
    } else if (selectedFromUnit == 'Pound') {
      if (selectedToUnit == 'Kilogram') convertedWeight = inputWeight * 0.453592;
      if (selectedToUnit == 'Gram') convertedWeight = inputWeight * 453.592;
      if (selectedToUnit == 'Ounce') convertedWeight = inputWeight * 16;
    } else if (selectedFromUnit == 'Ounce') {
      if (selectedToUnit == 'Kilogram') convertedWeight = inputWeight * 0.0283495;
      if (selectedToUnit == 'Gram') convertedWeight = inputWeight * 28.3495;
      if (selectedToUnit == 'Pound') convertedWeight = inputWeight * 0.0625;
    }

    setState(() {
      result = convertedWeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Berat'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input untuk nilai berat
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Berat',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Dropdown untuk unit awal
            DropdownButton<String>(
              value: selectedFromUnit,
              items: weightUnits.map((String unit) {
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
            // Dropdown untuk unit tujuan
            DropdownButton<String>(
              value: selectedToUnit,
              items: weightUnits.map((String unit) {
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
            // Tombol konversi
            ElevatedButton(
              onPressed: convertWeight,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            // Tampilan hasil konversi
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
