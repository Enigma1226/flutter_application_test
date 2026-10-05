import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/confirm_registration_controller.dart';
import 'package:flutter_application_test/components/custom_button.dart';
import 'package:flutter_application_test/components/custom_text.dart';
import 'package:flutter_application_test/components/custom_page.dart';

class ConfirmRegistrationPage extends StatelessWidget {
  ConfirmRegistrationPage({super.key});

  final controller = Get.put(ConfirmRegistrationController());

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: 'Confirm Page',
      scrollable: false, // agar card berada di tengah
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min, // card setinggi isinya
            children: [
              CustomText(
                text: 'Username: ${controller.username}',
                style: const TextStyle(fontSize: 20),
              ),
              CustomText(
                text: 'Nama Lengkap: ${controller.nama_lengkap}',
                style: const TextStyle(fontSize: 20),
              ),
              CustomText(
                text: 'Jenis Kelamin: ${controller.jenis_kelamin}',
                style: const TextStyle(fontSize: 20),
              ),
              CustomText(
                text: 'No HP: ${controller.no_hp}',
                style: const TextStyle(fontSize: 20),
              ),
              CustomText(
                text: 'Email: ${controller.email}',
                style: const TextStyle(fontSize: 20),
              ),
              CustomText(
                text: 'Password: ${controller.password}',
                style: const TextStyle(fontSize: 20),
              ),
              CustomText(
                text: 'Confirm Password: ${controller.confirm_password}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'ok',
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}