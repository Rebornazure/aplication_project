import 'package:aplication_project/menu/history.dart';
import 'package:aplication_project/menu/home.dart';
import 'package:aplication_project/menu/profile.dart';
import 'package:aplication_project/controller/list_produk_controller.dart';
import 'package:aplication_project/Routes.dart';
import 'package:aplication_project/Models/produk_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changepage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listpages = [homepage(), historypage(), profilepage()];
}

class HomeController extends GetxController {
  final ListProdukController produkController = Get.put(ListProdukController());
  
  Offset tapPosition = Offset.zero;

  void simpanTapPosition(TapDownDetails details) {
    tapPosition = details.globalPosition;
  }

  Future<void> refreshProduk() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  void hapusProduk(int index, ProdukModel produk) {
    produkController.listProduk.removeAt(index);
    Get.snackbar(
      "Produk Dihapus",
      "${produk.namaProduk} telah dihapus dari daftar.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void goDetail(ProdukModel produk) {
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
    Get.snackbar(
      "Detail Produk",
      "Beralih ke detail produk.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
