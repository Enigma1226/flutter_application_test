import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const new({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  TextEditingController txtEmail = TextEditingController(); 
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusRegis = "";


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}