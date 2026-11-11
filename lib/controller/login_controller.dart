
import 'package:aplication_project/Routes.dart';
import 'package:aplication_project/Models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  void login() async {
    if (txtUsername.text.toString().isEmpty ||
        txtPassword.text.toString().isEmpty) {

      Get.snackbar("error", "username dan password nya harus diisi");

    } else {

      try {

        isLoading.value = true;

        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(url, body: {
          "username": txtUsername.text.toString(),
          "password": txtPassword.text.toString(),
        });

        isLoading.value = false;

        if (response.statusCode == 200) {

          // mengambil data JSON menggunakan LoginModel
          loginModel.value = loginModelFromJson(response.body);

          if (loginModel.value?.status == true) {

            Get.snackbar(
              "berhasil",
              loginModel.value!.message.toString()
            );

            Get.offNamed(Routes.mainmenudrawer);

          } else {

            Get.snackbar(
              "gagal",
              loginModel.value!.message.toString()
            );

          }

        } else {

          Get.snackbar("gagal", "cek internet connection");

        }

      } catch (e) {

        isLoading.value = false;

        Get.snackbar("gagal", e.toString());
        print("error nya " + e.toString());
      }
    }
  }
}
