import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var hasilHitung = 0.0.obs; // .obs supaya UI otomatis update

  void tambah(double angka1, double angka2) {
    double hasiltambah = angka1 + angka2;
    hasilHitung.value = hasiltambah;
    Get.snackbar("hasil tambah", "hasil nya $hasiltambah");
  }

  void kurang(double angka1, double angka2) {
    double hasilkurang = angka1 - angka2;
    hasilHitung.value = hasilkurang;
    Get.snackbar("hasil kurang", "hasil nya $hasilkurang");
  }

  void kali(double angka1, double angka2) {
    double hasilkali = angka1 * angka2;
    hasilHitung.value = hasilkali;
    Get.snackbar("hasil kali", "hasil nya $hasilkali");
  }

  void bagi(double angka1, double angka2) {
  if (angka2 == 0) {
    Get.snackbar("Warning", "Tidak bisa membagi dengan nol");
    return;
  }
  hasilHitung.value = angka1 / angka2;
  Get.snackbar("hasil bagi", "hasil nya ${hasilHitung.value}");
}
}