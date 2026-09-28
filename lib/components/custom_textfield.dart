import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // untuk TextInputFormatter

class CustomTextfield extends StatelessWidget {
  final String myHint;
  final TextEditingController txtController;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: myHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}