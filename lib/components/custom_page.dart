import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final String title;
  final Widget child;
  final Color backgroundColor;
  final Color appBarColor;
  final bool centerTitle;
  final EdgeInsets padding;

  const CustomPage({
    super.key,
    required this.title,
    required this.child,
    this.backgroundColor = const Color(0xFFF5F7FB),
    this.appBarColor = const Color(0xFF2E09B6),
    this.centerTitle = true,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: centerTitle,
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padding,
          child: Center(
            child: ConstrainedBox(
              // supaya tetap rapi di layar lebar (tablet / web)
              constraints: const BoxConstraints(maxWidth: 500),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}