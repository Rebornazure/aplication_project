import 'dart:convert';
import 'package:aplication_project/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;

  //method hit API
  Future<void> login() async{
    if(txtUsername.text.toString().isEmpty || txtPassword.text.toString().isEmpty){
      Get.snackbar("error", "username password nya harus diisi");
    }else{

      try{

        isLoading.value = true; // sebagai tanda di page nya muncul loading widget
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(url, body: {
          "username": txtUsername.text.toString(),
          "password": txtPassword.text.toString(),
        });

        isLoading.value = false;
        if(response.statusCode == 200){
          // kita ambil json nya messeage pindah tampilan ke main menu
          final data = jsonDecode(response.body);
          if(data['status'] == true){
            Get.snackbar("berhasil", data['message']);
            Get.offNamed(Routes.mainmenudrawer);
          } else {
            Get.snackbar("Gagal", data['message']);
          }

        } else {
          Get.snackbar("Gagal", "internet e cek en sek");
        }

      } catch (e) {
        Get.snackbar("Error", "Adaa kesalahan: $e");
      }
      
    }
  }

}