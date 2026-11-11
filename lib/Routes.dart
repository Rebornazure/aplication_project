import 'package:aplication_project/Pages/confirm_registration_page.dart';
import 'package:aplication_project/Pages/list_produk_page.dart';
import 'package:aplication_project/Pages/login_clone_fixs.dart';
import 'package:aplication_project/Pages/registration_page.dart';
import 'package:aplication_project/Pages/detail_produk_page.dart';
import 'package:aplication_project/Pages/mainmenu_drawer.dart';
import 'package:aplication_project/Pages/main_menu_page.dart';
import 'package:aplication_project/menu/homedart_api.dart';

import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmregistration = "/confirmregistration";
  static const String detailproduk = "/detail-produk";
  static const String listproduk = "/list-produk";
  static const String mainmenupage = "/mainmenupage";
  static const String mainmenudrawer = "/mainmenudrawer";
  static const String homepage = "/homepage";
  static const String login = "/login";

  static final mypages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirmregistration, page: () => ConfirmRegistrationPage()),
    GetPage(name: detailproduk, page: () => DetailProdukPage()),
    GetPage(name: listproduk, page: () => ListProdukPage()),
    GetPage(name: mainmenupage, page: () => MainMenuPage()),
    GetPage(name: mainmenudrawer, page: () => MainMenuDrawer()),
    GetPage(name: homepage, page: () => apihomedart()),
    GetPage(name: login, page: () => LoginClonefixs()),
  ];
}