import 'package:aplication_project/controller/confirm_registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmRegistrationPage extends StatelessWidget {
  const ConfirmRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConfirmRegistrationController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Confirm Registration"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.check_circle, size: 80, color: Colors.green),
            SizedBox(height: 8),
            Text(
              "Periksa kembali data kamu",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama : " + controller.nama.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    Divider(height: 24),
                    Text(
                      "alamat : " + controller.alamat.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    Divider(height: 24),
                    Text(
                      "jenis kelamin : " + controller.jeniskelamin.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    Divider(height: 24),
                    Text(
                      "umur : " + controller.umur.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    Divider(height: 24),
                    Text(
                      "Email : " + controller.Email.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    Divider(height: 24),
                    Text(
                      "No HP : " + controller.Nohp.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    Divider(height: 24),
                    Text(
                      "NIS : " + controller.NIS.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text("Kembali", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}