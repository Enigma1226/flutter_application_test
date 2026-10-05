import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_test/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Belajar GetX',
      initialRoute: Routes.registration,
      getPages: Routes.myPages,
    );
  }
}