import 'package:flutter_application_test/menu/history_page.dart';
import 'package:flutter_application_test/menu/home_page.dart';
import 'package:flutter_application_test/menu/profile_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/menu_model.dart';

class DrawerControllerX extends GetxController {
  var selectedIndex = 0.obs;

  final List<MenuModel> menuItems = [
    MenuModel(title: 'Home', icon: Icons.dashboard),
    MenuModel(title: 'History', icon: Icons.people),
    MenuModel(title: 'Profile', icon: Icons.person),
  ];

  final List<Widget> pages = [
    const HomePage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
    Get.back();
  }
}