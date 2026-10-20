import 'package:aplication_project/Pages/confirm_registration_page.dart';
import 'package:aplication_project/Pages/list_produk_page.dart';
import 'package:aplication_project/Pages/registration_page.dart';
import 'package:aplication_project/Pages/detail_produk_page.dart';
import 'package:aplication_project/Pages/main_menu_page.dart';
import 'package:get/get.dart';

class Routes {
  // list halaman atau pages yang ada di aplikasi
  static const String registration = "/registration";
  static const String confirmregistration = "/confirmregistration";
  static const String detailproduk = "/detail-produk";
  static const String listproduk = "/list-produk";
  static const String mainmenu = "/main-menu";
  // dll,login dan kalkulator

  // masukkan ke dalam array yang akan kita pasang ke main.dart
  static final mypages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirmregistration, page: () => ConfirmRegistrationPage()),
    GetPage(name: detailproduk, page: () => DetailProdukPage()),
    GetPage(name: listproduk, page: () => ListProdukPage()),
    GetPage(name: mainmenu, page: () => MainMenuPage()),
    // other pages here dll
  ];
}
