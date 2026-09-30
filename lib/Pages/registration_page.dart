import 'package:aplication_project/Components/MyTextField.dart';
import 'package:aplication_project/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final txtNama = TextEditingController();
    final txtalamat = TextEditingController();
    final txtjeniskelamin = TextEditingController();
    final txtumur = TextEditingController();
    final txtEmail = TextEditingController();
    final txtNohp = TextEditingController();
    final txtNIS = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Registration"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextfield(
              myHint: "Nama",
              txtController: txtNama,
              radius: 12,
              icon: Icons.person,
            ),
            MyTextfield(
              myHint: "Alamat",
              txtController: txtalamat,
              radius: 12,
              icon: Icons.home,
            ),
            MyTextfield(
              myHint: "Jenis Kelamin",
              txtController: txtjeniskelamin,
              radius: 12,
              icon: Icons.wc,
            ),
            MyTextfield(
              myHint: "Umur",
              txtController: txtumur,
              radius: 12,
              icon: Icons.cake,
              numberOnly: true,
              maxLength: 3,
            ),
            MyTextfield(
              myHint: "Email",
              txtController: txtEmail,
              radius: 12,
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            MyTextfield(
              myHint: "No HP",
              txtController: txtNohp,
              radius: 12,
              icon: Icons.phone,
              numberOnly: true,
              maxLength: 15,
            ),
            MyTextfield(
              myHint: "NIS",
              txtController: txtNIS,
              radius: 12,
              icon: Icons.badge,
              numberOnly: true,
              maxLength: 12,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (txtNama.text.trim().isEmpty ||
                    txtalamat.text.trim().isEmpty ||
                    txtjeniskelamin.text.trim().isEmpty ||
                    txtumur.text.trim().isEmpty ||
                    txtEmail.text.trim().isEmpty ||
                    txtNohp.text.trim().isEmpty ||
                    txtNIS.text.trim().isEmpty) {
                  Get.snackbar(
                    "Peringatan",
                    "Semua data harus diisi",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16),
                  );
                  return;
                }

                Get.toNamed(
                  Routes.confirmregistration,
                  arguments: {
                    'name': txtNama.text.trim(),
                    'alamat': txtalamat.text.trim(),
                    'jenis kelamin': txtjeniskelamin.text.trim(),
                    'umur': txtumur.text.trim(),
                    'Email': txtEmail.text.trim(),
                    'Nohp': txtNohp.text.trim(),
                    'NIS': txtNIS.text.trim(),
                  },
                );
              },
              child: const Text("Send", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
