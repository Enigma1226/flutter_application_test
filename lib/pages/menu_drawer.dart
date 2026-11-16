import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/drawer_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final DrawerControllerX controller = Get.put(DrawerControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () =>
              Text(controller.menuItems[controller.selectedIndex.value].title),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Administrator'),
              accountEmail: Text('admin@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person, size: 35),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.menuItems.length,
                itemBuilder: (context, index) {
                  final menu = controller.menuItems[index];

                  return Obx(() {
                    final selected = controller.selectedIndex.value == index;

                    return ListTile(
                      leading: Icon(
                        menu.icon,
                        color: selected ? Colors.blue : Colors.grey,
                      ),
                      title: Text(
                        menu.title,
                        style: TextStyle(
                          fontWeight: selected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: selected ? Colors.blue : Colors.black,
                        ),
                      ),
                      selected: selected,
                      selectedTileColor: Colors.blue.withOpacity(0.1),
                      onTap: () {
                        controller.changePage(index);
                      },
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),

      // BODY
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
    );
  }
}