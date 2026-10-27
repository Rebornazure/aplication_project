import 'package:aplication_project/Models/produk_model.dart';
import 'package:aplication_project/Routes.dart';
import 'package:aplication_project/controller/list_produk_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  void _goDetail(ProdukModel produk) {
    Get.toNamed(
      Routes.detailproduk,
      arguments: {
        'namaProduk': produk.namaProduk,
        'harga': produk.harga,
        'description': produk.description,
        'imagePath': produk.imagePath,
        'review': produk.review,
        'rating': produk.rating,
        'namaToko': produk.namaToko,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get.put mengembalikan instance yang sama kalau controller sudah ada
    final controller = Get.put(ListProdukController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                "Smartphone Flagship",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // ListView horizontal wajib punya tinggi, makanya dibungkus Container(height)
            Container(
              height: 230,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: controller.listProduk.length,
                  itemBuilder: (context, index) {
                    final produk = controller.listProduk[index];
                    final displayHarga = produk.harga.startsWith("Rp")
                        ? produk.harga
                        : "Rp ${produk.harga}";

                    return SizedBox(
                      width: 170,
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.black12,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          onTap: () => _goDetail(produk),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: double.infinity,
                                color: Colors.grey[200],
                                child: Image.network(
                                  produk.imagePath,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.broken_image,
                                        color: Colors.grey,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      produk.namaProduk,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      displayHarga,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          "${produk.rating}",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}