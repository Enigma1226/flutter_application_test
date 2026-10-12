import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_test/models/makanan_model.dart';

class DetailMakananPage extends StatelessWidget {
  const DetailMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MakananModel makanan = Get.arguments as MakananModel;

    return Scaffold(
      appBar: AppBar(title: Text(makanan.namaMakanan)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto makanan
          Image.network(
            makanan.gambar,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const SizedBox(
            height: 250,
            child: Center(child: CircularProgressIndicator()),
          );
        },
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 60),
),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    makanan.namaMakanan,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(makanan.rating),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    makanan.harga,
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    makanan.deskripsi,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}