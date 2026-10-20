import 'package:aplication_project/Routes.dart';
import 'package:aplication_project/Models/produk_model.dart';
import 'package:aplication_project/controller/list_produk_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProdukPage extends StatelessWidget {
  ListProdukPage({super.key});
  final controller = Get.put(ListProdukController());

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

  void _hapus(ProdukModel produk) {
    controller.listProduk.remove(produk);
    Get.snackbar(
      "Produk Dihapus",
      "${produk.namaProduk} telah dihapus dari daftar.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 250, 250),
      appBar: AppBar(title: const Text("List Produk")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => RefreshIndicator(
            onRefresh: controller.refreshProduk,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.listProduk.length,
              itemBuilder: (context, index) {
                final produk = controller.listProduk[index];
                final displayHarga = produk.harga.startsWith("Rp")
                    ? produk.harga
                    : "Rp ${produk.harga}";
                Offset tapPosition = Offset.zero;

                return Dismissible(
                  key: ValueKey(produk.namaProduk),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) => _hapus(produk),
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Card(
                    color: const Color.fromARGB(255, 255, 253, 208),
                    child: InkWell(
                      onTapDown: (details) {
                        tapPosition = details.globalPosition;
                      },
                      onLongPress: () {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            tapPosition.dx,
                            tapPosition.dy,
                            tapPosition.dx,
                            tapPosition.dy,
                          ),
                          items: [
                            PopupMenuItem(
                              child: const Text("Hapus"),
                              onTap: () => _hapus(produk),
                            ),
                            PopupMenuItem(
                              child: const Text("Detail"),
                              onTap: () {
                                _goDetail(produk);
                                Get.snackbar(
                                  "Detail Produk",
                                  "Beralih ke detail produk.",
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                            ),
                          ],
                        );
                      },
                      onTap: () => _goDetail(produk),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                              produk.imagePath,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Icon(
                                      Icons.broken_image,
                                      color: Colors.grey,
                                    ),
                                  ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    produk.namaProduk,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(displayHarga),
                                  Text(" ${produk.rating}"),
                                ],
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.chevron_right,
                              size: 24,
                              color: Colors.grey,
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
      ),
    );
  }
}