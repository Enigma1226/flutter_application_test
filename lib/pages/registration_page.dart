import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_test/components/custom_textfield.dart';
import 'package:flutter_application_test/components/custom_button.dart';
import 'package:flutter_application_test/components/custom_page.dart';
import 'package:flutter_application_test/routes.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtNamaLengkap = TextEditingController();
  final TextEditingController txtJenisKelamin = TextEditingController();
  final TextEditingController txtNoHp = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: 'Registration',
      scrollable: false, //membuat isi berada di tengah layar
      child: SingleChildScrollView( //agar tidak overflow saat keyboard muncul
        child: Column(
          mainAxisSize: MainAxisSize.min, //ukuran kolom menyesuaikan isi
          children: [
            //gambar user
            const CircleAvatar(
              radius: 70,
              backgroundColor: Color(0xFFEDE9FE),
              child: Icon(
                Icons.person,
                size: 85,
                color: Color(0xFF2E09B6),
              ),
            ),
            const SizedBox(height: 24),

            CustomTextfield(
              myHint: 'input username',
              txtController: txtUsername,
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: 'Nama Lengkap',
              txtController: txtNamaLengkap,
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: 'Jenis Kelamin',
              txtController: txtJenisKelamin,
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: 'No HP',
              txtController: txtNoHp,
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: 'Email',
              txtController: txtEmail,
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: 'Password',
              txtController: txtPassword,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: 'Confirm Password',
              txtController: txtConfirmPassword,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Send',
              onPressed: () {
                Get.toNamed(
                  Routes.confirm_registration,
                  arguments: {
                    'username': txtUsername.text,
                    'nama_lengkap': txtNamaLengkap.text,
                    'jenis_kelamin': txtJenisKelamin.text,
                    'no_hp': txtNoHp.text,
                    'email': txtEmail.text,
                    'password': txtPassword.text,
                    'confirm_password': txtConfirmPassword.text,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}