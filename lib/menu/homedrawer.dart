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
          "Surya STORE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 234, 170),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.refreshProduk,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            children: [
              const Text(
                "Daftar Produk",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.produkController.listProduk.length,

                  itemBuilder: (context, index) {
                    final produk =
                        controller.produkController.listProduk[index];

                    final displayHarga = produk.harga.startsWith("Rp")
                        ? produk.harga
                        : "Rp ${produk.harga}";

                    return Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 10),

                      child: Card(
                        color: const Color.fromARGB(255, 133, 217, 234),
                        elevation: 3,
                        clipBehavior: Clip.antiAlias,

                        child: InkWell(
                          onTapDown: (details) {
                            controller.simpanTapPosition(details);
                          },

                          onTap: () {
                            controller.goDetail(produk);
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
                                const PopupMenuItem(
                                  value: "hapus",
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete, color: Colors.red),
                                      SizedBox(width: 8),
                                      Text("Hapus"),
                                    ],
                                  ),
                                ),

                                const PopupMenuItem(
                                  value: "detail",
                                  child: Row(
                                    children: [
                                      Icon(Icons.info_outline),
                                      SizedBox(width: 8),
                                      Text("Detail"),
                                    ],
                                  ),
                                ),
                              ],
                            ).then((value) {
                              if (value == "hapus") {
                                controller.hapusProduk(index, produk);
                              } else if (value == "detail") {
                                controller.goDetail(produk);
                              }
                            });
                          },

                          child: Padding(
                            padding: const EdgeInsets.all(10),

                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),

                                  child: Image.network(
                                    produk.imagePath,
                                    width: 80,
                                    height: 120,
                                    fit: BoxFit.cover,

                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 80,
                                        height: 120,
                                        color: Colors.white,
                                        child: const Icon(
                                          Icons.broken_image,
                                          size: 40,
                                          color: Colors.redAccent,
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Text(
                                        produk.namaProduk,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      Text(
                                        displayHarga,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "${produk.rating}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      const Icon(Icons.arrow_forward, size: 20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
