import 'package:flutter/material.dart';
import 'package:flutter_application_test/controllers/login_clone_controller.dart';
import 'package:flutter_application_test/components/facebook_comp.dart';
import 'package:get/get.dart';

class LoginClone extends StatelessWidget {
  LoginClone({super.key});

  final controller = Get.put(LogCloneController());

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.topCenter,
                  child: FbLanguageDropdown(),
                ),
                const SizedBox(height: 40),
                const FbLogoText(),
                const SizedBox(height: 32),
                FbTextField(
                  controller: controller.txtUsername,
                  hintText: 'Mobile number or email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                FbTextField(
                  controller: controller.txtPassword,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => FbPrimaryButton(
                    text: 'Log in',
                    onPressed: controller.login,
                    isLoading: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 16),
                FbTextLink(
                  text: 'Forgot password?',
                  onTap: () {},
                ),
                const SizedBox(height: 120),
                FbSecondaryButton(
                  text: 'Create new account',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}