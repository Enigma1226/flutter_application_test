import 'package:get/get.dart';
import 'package:flutter_application_test/pages/confirm_registration.dart';
import 'package:flutter_application_test/pages/registration_page.dart';
import 'package:flutter_application_test/pages/list_makanan_page.dart';
import 'package:flutter_application_test/pages/detail_makanan_page.dart';
import 'package:flutter_application_test/pages/main_menu.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  static const String list_makanan = "/list_makanan";
  static const String detail_makanan = "/detail_makanan";
  static const String main_menu = "/main_menu";
  // dll

  // kita masukkan ke dalam myPages array
  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegistrationPage()),
    GetPage(name: list_makanan, page: () => ListMakananPage()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
    GetPage(name: main_menu, page: () => MainMenu()),
    // dll
  ];
}