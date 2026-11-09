import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_test/pages/main_menu.dart';

class LoginController extends GetxController {

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

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
      if(response.statusCode == 200){
        //ambil json message pindah tampilan ke main menu
        final data = jsonDecode(response.body);
        if(data['status'] == true){
          Get.snackbar("berhasil", data ['message']);
          Get.off(() => MainMenu());
        }else{
          Get.snackbar("gagal", data ['message']);
        }

      }else{
        Get.snackbar("gagal", "cek internet connection!");
      }

    } catch (e){
    Get.snackbar("gagal", e.toString());
    }
  }
  }
}