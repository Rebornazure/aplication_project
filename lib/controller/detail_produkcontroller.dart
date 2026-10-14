import 'package:get/get.dart';

class DetailProdukController extends GetxController {
  late String namaProduk;
  late String harga;
  late String description;
  late String imagePath;
  late int review;
  late double rating;
  late String namaToko;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;

    namaProduk = args['namaProduk'];
    harga = args['harga'];
    description = args['description'];
    imagePath = args['imagePath'];
    review = args['review'];
    rating = args['rating'];
    namaToko = args['namaToko'];
  }
}
