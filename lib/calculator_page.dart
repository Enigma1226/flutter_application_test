import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_test/controllers/calculator_controller.dart';
import 'package:flutter_application_test/components/custom_textfield.dart';
import 'package:flutter_application_test/components/custom_page.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final controller = Get.put(CalculatorController());
  final txtangka1 = TextEditingController();
  final txtangka2 = TextEditingController();

  // validasi + jalankan operasi
  void hitung(void Function(double, double) operasi) {
    final a = double.tryParse(txtangka1.text);
    final b = double.tryParse(txtangka2.text);

    if (a == null || b == null) {
      Get.snackbar("Warning", "Angka 1 dan angka 2 tidak boleh kosong");
      return;
    }
    operasi(a, b);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: "My kalkulator",
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextfield(
              myHint: "input angka 1",
              txtController: txtangka1,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],

            ),
            const SizedBox(height: 10),
            CustomTextfield(
              myHint: "input angka 2",
              txtController: txtangka2,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => hitung(controller.tambah),
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => hitung(controller.kurang),
                  child: const Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => hitung(controller.kali),
                  child: const Text("×"),
                ),
                ElevatedButton(
                  onPressed: () => hitung(controller.bagi),
                  child: const Text("÷"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                "hasil ${controller.hasilHitung.value}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}