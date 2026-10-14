import 'package:aplication_project/Components/Custom_MyTextField.dart'; // Sesuaikan path file kamu
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextfield( // Ubah dari MyTextField ke CustomTextfield
                txtController: txtUsername,
                hint: "input username", // Ubah dari myHint ke hint
                cornerRadius: 10,       // Ubah dari Radius ke cornerRadius
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextfield(
                txtController: txtPassword,
                hint: "input password",
                cornerRadius: 10,
                obscureText: true, // Sembunyikan teks untuk password
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String username = txtUsername.text.toString();
                      String password = txtPassword.text.toString();
                      if (username == "admin" && password == "admin") {
                        statusLogin = "sukses login admin";
                      } else {
                        statusLogin = "gagal login admin";
                      }
                    });
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 5, 165, 66),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("Register")),
              ],
            ),
            const SizedBox(height: 20),
            Text("status login : $statusLogin", style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}