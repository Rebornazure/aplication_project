import 'package:get/get.dart';

class ConfirmRegistrationController extends GetxController {
  late String nama;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final arguments = Get.arguments; // menangkap data dari tampilan sebelumnya
    nama = arguments['name'];
    // jenis kelamin dll
  }
}