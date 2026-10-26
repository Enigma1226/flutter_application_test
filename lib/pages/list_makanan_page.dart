import 'package:flutter/material.dart';
import 'package:flutter_application_test/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_application_test/components/custom_page.dart';
import 'package:flutter_application_test/widgets/makanan_card.dart';
import 'package:flutter_application_test/controllers/list_makanan_controller.dart';

class ListMakananPage extends StatelessWidget {
  const ListMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListMakananController());

    return CustomPage(
      title: "Daftar Makanan",
      scrollable: false,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.dataMakanan.length,
          itemBuilder: (context, index) {
            final makanan = controller.dataMakanan[index];
            return MakananCard(
              makanan: makanan,
              onTap: () {
                Get.toNamed(Routes.detail_makanan, arguments: makanan);
              },
              onDismissed: () {
                controller.dataMakanan.remove(makanan);
              },
            );
          },
        ),
      ),
    );
  }
}