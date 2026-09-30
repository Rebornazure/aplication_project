import 'package:aplication_project/Pages/confirm_registration_page.dart';
import 'package:aplication_project/Pages/registration_page.dart';
import 'package:get/get.dart';

class Routes {
  // list halaman atau pages yang ada di aplikasi
  static const String registration = "/registration";
  static const String confirmregistration = "/confirmregistration";
  // dll,login dan kalkulator

  // masukkan ke dalam array yang akan kita pasang ke main.dart
  static final mypages = [
    GetPage(name: registration, page:()=> RegistrationPage()),
    GetPage(name: confirmregistration, page:()=> ConfirmRegistrationPage()),
    // other pages here dll
  ];
}
