import 'package:get/get.dart';

class RegistrationController extends GetxController {
  late String nama;
  late String alamat;
  late String jeniskelamin;
  late String umur;
  late String Email;
  late String Nohp;
  late String NIS;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final arguments = Get.arguments; // menangkap data dari tampilan sebelumnya
    nama = arguments['name'];
    alamat = arguments['alamat'];
    jeniskelamin = arguments['jenis kelamin'];
    umur = arguments['umur'];
    Email = arguments['Email'];
    Nohp = arguments['No HP'];
    NIS = arguments['NIS'];
    // jenis kelamin dll
  }
}
