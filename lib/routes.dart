import 'package:get/get.dart';
import 'package:flutter_application_test/pages/confirm_registration.dart';
import 'package:flutter_application_test/pages/registration_page.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  // dll

  // kita masukkan ke dalam myPages array
  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegistrationPage()),
    // dll
  ];
}