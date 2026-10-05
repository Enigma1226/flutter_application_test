import 'package:get/get.dart';

class ConfirmRegistrationController extends GetxController {
  late String username;
  late String nama_lengkap;
  late String jenis_kelamin;
  late String no_hp;
  late String email;
  late String password;
  late String confirm_password;

  @override
  void onInit() {
    //TODO: implement onInit
    super.onInit();
    final arguments = Get.arguments;
    username = arguments['username'];
    nama_lengkap = arguments['nama_lengkap'];
    jenis_kelamin = arguments['jenis_kelamin'];
    no_hp = arguments['no_hp'];
    email = arguments['email'];
    password = arguments['password'];
    confirm_password = arguments['confirm_password'];
  }
}