import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController a1Controller = TextEditingController();
  final TextEditingController a2Controller = TextEditingController();

  String hasil = '0';

  @override
  void dispose() {
    a1Controller.dispose();
    a2Controller.dispose();
    super.dispose();
  }

  bool _validasiInput() {
    final a1 = double.tryParse(a1Controller.text);
    final a2 = double.tryParse(a2Controller.text);

    if (a1 == null || a2 == null) {
      setState(() {
        hasil = 'Input tidak valid';
      });
      return false;
    }
    return true;
  }

  void tambah() {
    if (!_validasiInput()) return;
    final a1 = double.parse(a1Controller.text);
    final a2 = double.parse(a2Controller.text);
    setState(() => hasil = _formatHasil(a1 + a2));
  }

  void kurang() {
    if (!_validasiInput()) return;
    final a1 = double.parse(a1Controller.text);
    final a2 = double.parse(a2Controller.text);
    setState(() => hasil = _formatHasil(a1 - a2));
  }

  void kali() {
    if (!_validasiInput()) return;
    final a1 = double.parse(a1Controller.text);
    final a2 = double.parse(a2Controller.text);
    setState(() => hasil = _formatHasil(a1 * a2));
  }

  void bagi() {
    if (!_validasiInput()) return;
    final a1 = double.parse(a1Controller.text);
    final a2 = double.parse(a2Controller.text);

    if (a2 == 0) {
      setState(() => hasil = 'Tidak bisa dibagi 0');
      return;
    }
    setState(() => hasil = _formatHasil(a1 / a2));
  }

  String _formatHasil(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calculator'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: a1Controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                  decoration: const InputDecoration(
                    labelText: 'A1',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: a2Controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                  decoration: const InputDecoration(
                    labelText: 'A2',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: tambah,
                      child: const Text('+'),
                    ),
                    ElevatedButton(
                      onPressed: kurang,
                      child: const Text('-'),
                    ),
                    ElevatedButton(
                      onPressed: kali,
                      child: const Text('x'),
                    ),
                    ElevatedButton(
                      onPressed: bagi,
                      child: const Text('/'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Hasil:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  hasil,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}