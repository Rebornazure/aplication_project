import 'package:aplication_project/controller/confirm_registration_controller.dart';
import 'package:aplication_project/controller/confirm_registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmRegistrationPage extends StatelessWidget {
  const ConfirmRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConfirmRegistrationController());

    return Scaffold(
      appBar: AppBar(title: Text("Confirm Registration")),
      body: Column(
        children: [
          Text(
            "Nama : " + controller.nama.toString(),
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
          // others data jenis kelamin, alamat dll
        ],
      ),
    );
  }
}