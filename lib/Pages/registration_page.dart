import 'package:aplication_project/Components/MyTextField.dart';
import 'package:aplication_project/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtNama = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Column(
        children: [
          MyTextfield(myHint: "input nama", txtController: txtNama, radius: 10),
          // lanjutkan dengan form yang lain alamat jenis kelamin dll
          ElevatedButton(
            onPressed: () {
              // pindah tampilan dan mengirim data
              Get.toNamed(
                Routes.confirmregistration,
                arguments: {
                  'name': txtNama.text.toString(),
                  'jenis_kelamin': "laki laki", //dari widget kalian
                },
              );
            },
            child: Text("send"),
          ),
        ],
      ),
    );
  }
}