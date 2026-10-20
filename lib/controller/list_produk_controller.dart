import 'package:aplication_project/Models/produk_model.dart';
import 'package:get/get.dart';

class ListProdukController extends GetxController {
  
  final List<ProdukModel> produkAwal = [
    ProdukModel(
      "Samsung Galaxy S25 Ultra",
      "22.999.000 - Rp 28.999.000",
      "Samsung Galaxy S25 Ultra adalah smartphone flagship kelas atas dengan layar 6,9 inci, bodi titanium, kamera utama 200 MP, S Pen, serta fitur Galaxy AI yang membantu berbagai aktivitas pengguna.",
      "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQVkfEk-OTy1Y8XSQBflMjbKnVe-vYG8Nnd8A1mQEyK0YVtp6DcN2yojHpV6xydiqjXXcwDmshjQpXPf5zl9bc4HFicsqk93OUZp1DxWJ8jTYMLyQSkGxat-NFo2rvfgh9F0TA-5KQ&usqp=CAc",
      76,
      4.8,
      "Samsung Official Store",
    ),
    ProdukModel(
      "iPhone 17 Pro Max",
      "24.999.000 - Rp 31.999.000",
      "iPhone 17 Pro Max adalah smartphone flagship Apple dengan layar Super Retina XDR, chip A19 Pro, sistem kamera Pro yang canggih, serta desain premium untuk performa tinggi dan fotografi profesional.",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQHhcKf3NiiTjroTKrM3PA_0AainLI7PPl16Rm8g-BQw&s",
      128,
      4.9,
      "iBox Official Store",
    ),
    ProdukModel(
      "ASUS ROG Phone 9 Pro",
      "17.999.000 - Rp 21.999.000",
      "ASUS ROG Phone 9 Pro adalah smartphone gaming premium dengan layar AMOLED ber-refresh rate tinggi, performa powerful, baterai berkapasitas besar, serta sistem pendingin yang dirancang untuk menjaga performa saat bermain game.",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1nzrmZWTmu0fgdtR-CohIY6BJeAxYzy_rPH2msgcz4g&s=10",
      95,
      4.8,
      "ROG Flagship Store",
    ),
    ProdukModel(
      "Xiaomi 15 Ultra",
      "16.999.000 - Rp 19.999.000",
      "Xiaomi 15 Ultra adalah smartphone flagship dengan layar AMOLED berkualitas tinggi, chipset Snapdragon kelas atas, kamera Leica, serta baterai berkapasitas besar dengan dukungan pengisian daya cepat.",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDuK6OyapIwGNt3Emwn1YouDq8IpWaH0xCgz4I5o6RCg&s=10",
      89,
      4.8,
      "Xiaomi Official Store",
    ),
    ProdukModel(
      "Google Pixel 9 Pro XL",
      "18.999.000 - Rp 22.999.000",
      "Google Pixel 9 Pro XL adalah smartphone flagship Google dengan layar Super Actua, chipset Google Tensor G4, kamera berkualitas tinggi, serta berbagai fitur AI untuk fotografi dan produktivitas.",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu4UlsPYdBE_niihqfGJcuvZtMW8YILVjmdkup5RlK9g&s=10",
      67,
      4.7,
      "Google Official Store",
    ),
  ];


  late final RxList<ProdukModel> listProduk = produkAwal.toList().obs;

  Future<void> refreshProduk() async {
    await Future.delayed(const Duration(milliseconds: 500));
    listProduk.assignAll(produkAwal);
  }
}