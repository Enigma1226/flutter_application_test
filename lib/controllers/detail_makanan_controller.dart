import 'package:get/get.dart';
import 'package:flutter_application_test/models/makanan_model.dart';

class DetailMakananController extends GetxController {
  // Deklarasikan variabel makanan
  late MakananModel makanan;

  @override
  void onInit() {
    super.onInit();
    // Ambil data argumen di sini
    makanan = Get.arguments;
  }
}