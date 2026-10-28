import 'package:aplication_project/controller/list_produk_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

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
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => RefreshIndicator(
            onRefresh: controller.refreshProduk,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.produkController.listProduk.length,
                  itemBuilder: (context, index) {
                    final produk = controller.produkController.listProduk[index];
                    final displayHarga = produk.harga.startsWith("Rp")
                        ? produk.harga
                        : "Rp ${produk.harga}";

                    return Container(
                      width: 250,
                      child: Card(
                        child: Card(
                          color: const Color.fromARGB(255, 133, 217, 234),
                          child: InkWell(
                            onTapDown: (details) {
                              controller.simpanTapPosition(details);
                            },
                            onLongPress: () {
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  controller.tapPosition.dx,
                                  controller.tapPosition.dy,
                                  controller.tapPosition.dx,
                                  controller.tapPosition.dy,
                                ),
                                items: [
                                  PopupMenuItem(
                                    child: const Text("Hapus"),
                                    onTap: () {
                                      controller.hapusProduk(index, produk);
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: const Text("Detail"),
                                    onTap: () {
                                      controller.goDetail(produk);
                                    },
                                  ),
                                ],
                              );
                            },
                            onTap: () => controller.goDetail(produk),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.network(
                                    produk.imagePath,
                                    width: 200,
                                    height: 180,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(
                                      Icons.broken_image,
                                      size: 100,
                                      color: Color.fromARGB(255, 218, 133, 133),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        produk.namaProduk,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        displayHarga,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Rating : ${produk.rating}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}