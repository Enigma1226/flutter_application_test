import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_test/models/login_model.dart';

class LogCloneController extends GetxController {
 TextEditingController txtUsername = TextEditingController();
 TextEditingController txtPassword = TextEditingController();

 var loginModel = Rxn<LoginModel>();

  var isLoading = false.obs;

  //method hit API
  void login() async{
  if (txtUsername.text.toString().isEmpty || txtPassword.text.toString().isEmpty){
    Get.snackbar("Error", "username dan password harus terisi");
  }else{

    try{

      isLoading.value = true; //sebagai tanda di page muncul loading widget
      final url = Uri.parse("https://mediadwi.com/api/latihan/login");

      final response = await http.post(url, body: {
        "username" : txtUsername.text.toString(),
        "password" : txtPassword.text.toString()
      });

      isLoading.value = false;
          if (response.statusCode == 200) {
          // kita ambil jsonnya message pindah tampilan ke main menu
          // contoh json yang paling sederhana, next pertemuan jsonnya compleks
          loginModel.value = loginModelFromJson(response.body);
          // final data = jsonDecode(response.body);
          
          if (loginModel.value?.status == true) {
          Get.snackbar('Login Berhasil', loginModel.value?.message?? 'Login berhasil');
          Get.offNamed('/main_menu');
          } else {
            Get.snackbar('Login Gagal', loginModel.value?.message?? 'Login gagal');
          }

        } else {
          Get.snackbar('Login Gagal', 'Cek koneksi internet');
        }

      } catch (e) {
        isLoading.value = false;
        Get.snackbar('Login Gagal', e.toString());
      }
  }
  }
}