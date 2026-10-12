import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final String title;
  final Widget child;
  final Color backgroundColor;
  final Color appBarColor;
  final bool centerTitle;
  final EdgeInsets padding;

  // Tambahan baru (semua opsional)
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomBar;
  final bool scrollable;
  final bool showGradient;
  final Future<void> Function()? onRefresh;

  const CustomPage({
    super.key,
    required this.title,
    required this.child,
    this.backgroundColor = const Color(0xFFF5F7FB),
    this.appBarColor = const Color.fromARGB(255, 5, 236, 20),
    this.centerTitle = true,
    this.padding = const EdgeInsets.all(16),
    this.actions,
    this.floatingActionButton,
    this.bottomBar,
    this.scrollable = true,
    this.showGradient = true,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = ConstrainedBox(
      // supaya tetap rapi di layar lebar (tablet / web)
      constraints: const BoxConstraints(maxWidth: 500),
      child: Padding(padding: padding, child: child),
    );

    if (scrollable) {
      content = SingleChildScrollView(
        // wajib agar RefreshIndicator bisa ditarik walau konten pendek
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Center(child: content),
        ),
      );

      if (onRefresh != null) {
        content = RefreshIndicator(
          color: appBarColor,
          onRefresh: onRefresh!,
          child: content,
        );
      }
    } else {
      content = Center(child: content);
    }

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
        backgroundColor: showGradient ? Colors.transparent : appBarColor,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: actions,
        flexibleSpace: showGradient
            ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      appBarColor,
                      Color.lerp(appBarColor, Colors.white, 0.25)!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              )
            : null,
      ),
      body: SafeArea(child: content),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomBar == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: bottomBar,
              ),
            ),
    );
  }
}