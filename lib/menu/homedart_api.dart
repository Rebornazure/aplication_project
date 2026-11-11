import 'package:aplication_project/controller/api_produk_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class apihomedart extends StatelessWidget {
  const apihomedart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiProdukController());

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

        child: Obx(() {
          if (controller.isLoading.value && controller.listApiProduk.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.listApiProduk.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Data produk tidak tersedia"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: controller.getProduk,
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: controller.refreshProduk,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: 400,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listApiProduk.length,
                  itemBuilder: (context, index) {
                    final produk = controller.listApiProduk[index];

                    return Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 10),
                      child: Card(
                        color: const Color.fromARGB(255, 133, 217, 234),
                        elevation: 3,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            controller.goDetail(produk);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.network(
                                  produk.image,
                                  width: 200,
                                  height: 180,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.broken_image,
                                      size: 100,
                                      color: Colors.red,
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  produk.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "\$${produk.price.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "${produk.rating.rate} (${produk.rating.count} review)",
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    onPressed: () {
                                      controller.hapusProduk(produk);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
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
            ),
          );
        }),
      ),
    );
  }
}
