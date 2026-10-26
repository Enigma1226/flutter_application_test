import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/makanan_model.dart';

class MakananCard extends StatelessWidget {
  final MakananModel makanan;
  final VoidCallback onTap;
  final int? nomor; //? boleh kosong
  final VoidCallback? onDismissed;

  const MakananCard({
    super.key,
    required this.makanan,
    required this.onTap,
    this.nomor,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias, // Memotong konten bagian dalam agar melengkung rapi
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
             
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      makanan.gambar,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Icon(Icons.restaurant_menu),
                      ),
                    ),
                  ),
                  if (nomor != null)
                    Positioned(
                      top: 4,
                      left: 4,
                      child: CircleAvatar(
                        radius: 11,
                        backgroundColor: const Color.fromARGB(255, 241, 240, 243),
                        child: Text(
                          "$nomor",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),

              Expanded( // agar teks di dalamnya memanfaatkan sisa ruang dan tidak eror meluber ke kanan
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      makanan.namaMakanan,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      makanan.deskripsi,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          makanan.harga,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 0, 19),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 2),
                        Text(
                          makanan.rating,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (onDismissed == null) {
      return card;
    }

    return Dismissible(
      key: ValueKey(makanan.namaMakanan),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDismissed!.call(),
      child: card,
    );
  }
}