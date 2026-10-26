import 'package:flutter_application_test/menu/home_page.dart';
import 'package:flutter_application_test/menu/profile_page.dart';
import 'package:flutter_application_test/menu/history_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainMenuController extends GetxController{

final RxInt selectedIndex = 0.obs;

void changePage(int index){
selectedIndex.value = index;
}

List<Widget> listPages = [HomePage(), ProfilePage(), HistoryPage()];

}