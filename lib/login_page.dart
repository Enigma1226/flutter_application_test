import 'package:flutter/material.dart';
import 'package:flutter_application_test/components/custom_button.dart';
import 'package:flutter_application_test/components/custom_text.dart';
import 'package:flutter_application_test/components/custom_textfield.dart';
import 'package:flutter_application_test/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login API')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomText(
                  text: 'Welcome',
                  fontSize: 30,
                  color: Color.fromARGB(255, 46, 9, 182),
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const CustomText(
                  text: 'Silakan masuk dengan username dan password Anda',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CustomTextfield(
                  myHint: 'Input username',
                  txtController: controller.txtUsername,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextfield(
                  myHint: 'Input password',
                  txtController: controller.txtPassword,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),
                Obx(
                  () => CustomButton(
                    text: controller.isLoading.value ? 'Memproses...' : 'Login',
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.login,
                    height: 50,
                    backgroundColor: const Color.fromARGB(255, 46, 9, 182),
                    foregroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
