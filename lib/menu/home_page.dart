import 'package:flutter/material.dart';
import 'package:flutter_application_test/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_application_test/widgets/makanan_card_vertikal.dart';
import 'package:flutter_application_test/controllers/list_makanan_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  final controller = Get.put(ListMakananController());
    
 return Scaffold(
  appBar: AppBar(title: const Text("Daftar Makanan"), centerTitle: true),
  body: Obx(
    () => SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: controller.dataMakanan.length,
        itemBuilder: (context, index) {
          final makanan = controller.dataMakanan[index];
          return SizedBox(
            width: 180,
            child: MakananCardVertikal(
              makanan: makanan,
              onTap: () {
                Get.toNamed(Routes.detail_makanan, arguments: makanan);
              },
            ),
          );
        },
      ),
    ),
  ),
);
  }
}
  