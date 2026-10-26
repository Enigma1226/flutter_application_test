import 'package:flutter_application_test/models/makanan_model.dart';
import 'package:get/get.dart';

class ListMakananController extends GetxController {
  // Add your controller logic here

  final dataMakanan = <MakananModel>[
    MakananModel(
      namaMakanan: "Nasi Goreng",
      harga: "Rp 15.000",
      rating: "4.5",
      gambar: "https://awsimages.detik.net.id/community/media/visual/2022/11/25/resep-nasi-goreng-seafood_43.jpeg?w=600&q=90",
      deskripsi: "Nasi goreng adalah hidangan nasi yang digoreng dengan bumbu dan bahan tambahan seperti telur, ayam, atau sayuran.",
    ),
    MakananModel(
      namaMakanan: "Mie Goreng",
      harga: "Rp 12.000",
      rating: "4.2",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL5c3RVUqpANPIPKAxI9q29e_GKc5lm8p-K6thEMXSbQ&s=10",
      deskripsi: "Mie goreng adalah hidangan mie yang digoreng dengan bumbu dan bahan tambahan seperti telur, ayam, atau sayuran.",
    ),
    MakananModel(
      namaMakanan: "Ayam Bakar",
      harga: "Rp 20.000",
      rating: "4.7",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrXzoixd4X-QZ9VM7IgykDWOiGt_uI-h6-DWEimUrJLw&s=10",
      deskripsi: "Ayam bakar adalah hidangan ayam yang dibakar dengan bumbu dan bahan tambahan.",
    ),
    MakananModel(
      namaMakanan: "Ikan Bakar",
      harga: "Rp 25.000",
      rating: "4.6",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXDBPXQ1hLCJQOj_NZ2XTJw97N3u9xuMu7skiAdt3R_A&s=10",
      deskripsi: "Ikan bakar adalah hidangan ikan yang dibakar dengan bumbu dan bahan tambahan.",
    ),
    MakananModel(
      namaMakanan: "Sate Ayam",
      harga: "Rp 18.000",
      rating: "4.4",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHXwKw6VJUzaJ4h7Ge8l-pI0IuNM7ldrsF1Bqwaworkw&s=10",
      deskripsi: "Sate ayam adalah hidangan ayam yang dipotong kecil-kecil dan ditusuk dengan bambu, lalu dibakar dengan bumbu.",
    ),
    MakananModel(
      namaMakanan: "Sate Kambing",
      harga: "Rp 22.000",
      rating: "4.3",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDYPIuRt-ygzBjc3UWg6OyAgiCBrzLcaitO34-VnBIbw&s=10",
      deskripsi: "Sate kambing adalah hidangan daging kambing yang dipotong kecil-kecil dan ditusuk dengan bambu, lalu dibakar dengan bumbu.",
    ),
    MakananModel(
      namaMakanan: "Bakso",
      harga: "Rp 10.000",
      rating: "4.1",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0Nwy9f3_BASZPv_VphngKEFDzrb4GYj1I3IMTMrU4fg&s=10",
      deskripsi: "Bakso adalah hidangan daging yang dibuat dari daging sapi dan dibentuk bulat.",
    ),
    MakananModel(
      namaMakanan: "Soto Ayam",
      harga: "Rp 14.000",
      rating: "4.5",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3iZf4wFLAcZLjdfHlrBMHIX3XdKgGfM8sddnOYIUkZw&s=10",
      deskripsi: "Soto ayam adalah hidangan sup ayam yang disajikan dengan bahan tambahan seperti telur, sayuran, dan bumbu.",
    ),
    MakananModel(
      namaMakanan: "Gado-Gado",
      harga: "Rp 13.000",
      rating: "4.2",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXpSiRNrcGrXMwnVIuUxR13tJidl8dwIuBRqZYJp28fw&s=10",
      deskripsi: "Gado-gado adalah hidangan salad yang terdiri dari sayuran dan bumbu kacang.",
    ),
    MakananModel(
      namaMakanan: "Rendang",
      harga: "Rp 30.000",
      rating: "4.8",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgzUN4e6chr8mltHiWy75Xu4FW_qMhyKwg-MR3xQloqg&s=10",
      deskripsi: "Rendang adalah hidangan daging yang dimasak dengan bumbu dan santan hingga matang sempurna.",
    ),
  ].obs;
}
