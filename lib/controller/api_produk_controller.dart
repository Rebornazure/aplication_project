import 'package:aplication_project/Models/api_produk_model.dart';
import 'package:get/get.dart';
import 'package:aplication_project/Routes.dart';
import 'package:http/http.dart' as http;

class ApiProdukController extends GetxController {
  var listApiProduk = <ApiProdukModel>[].obs;
  var isLoading = false.obs;
  final String url = "https://fakestoreapi.com/products";
  @override
  void onInit() {
    super.onInit();
    getProduk();
  }

  Future<void> getProduk() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        listApiProduk.value = apiProdukModelFromJson(response.body);
      } else {
        Get.snackbar("Gagal", "Tidak berhasil mengambil data produk");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshProduk() async {
    await getProduk();
  }

  void hapusProduk(ApiProdukModel produk) {
    listApiProduk.remove(produk);
    Get.snackbar(
      "Produk Dihapus",
      "${produk.title} telah dihapus dari daftar.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void goDetail(ApiProdukModel produk) {
    Get.toNamed(
      Routes.detailproduk,
      arguments: {
        'namaProduk': produk.title,
        'harga': "\$${produk.price.toStringAsFixed(2)}",
        'description': produk.description,
        'imagePath': produk.image,
        'review': produk.rating.count,
        'rating': produk.rating.rate,
        'namaToko': produk.category.name,
      },
    );
  }
}
