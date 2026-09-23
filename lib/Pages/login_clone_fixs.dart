import 'package:flutter/material.dart';
import 'package:aplication_project/Components/formlabel.dart';
import 'package:aplication_project/Components/custom_text_field.dart';
import 'package:aplication_project/Components/primary_button.dart';
import 'package:aplication_project/Components/social_button.dart';
import 'package:aplication_project/Components/custom_image.dart';

class LoginClonefixs extends StatelessWidget {
  LoginClonefixs({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> obscureTextNotifier = ValueNotifier<bool>(true);

  final String logoRuangguruUrl =
      'https://upload.wikimedia.org/wikipedia/commons/7/7f/Ruangguru_logo.png';
  final String googleIconUrl =
      'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Center(
                child: CustomImage(
                  imageUrl: logoRuangguruUrl,
                  height: 40,
                  width: 120,
                  fit: BoxFit.contain,
                  fallbackWidget: const Text(
                    'ruangguru',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00A2E9),
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'Masuk ke Akunmu',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Yuk, lanjut belajar bareng Ruangguru!',
                style: TextStyle(fontSize: 14, color: Color(0xFF757575)),
              ),

              const SizedBox(height: 32),

              const FormLabel(label: 'Email atau Nomor HP'),
              CustomTextField(
                controller: emailController,
                hintText: 'Contoh: email@gmail.com',
              ),

              const SizedBox(height: 20),

              const FormLabel(label: 'Kata Sandi'),
              ValueListenableBuilder<bool>(
                valueListenable: obscureTextNotifier,
                builder: (context, isObscured, child) {
                  return CustomTextField(
                    controller: passwordController,
                    hintText: 'Masukkan kata sandi',
                    obscureText: isObscured,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF757575),
                      ),
                      onPressed: () {
                        obscureTextNotifier.value = !obscureTextNotifier.value;
                      },
                    ),
                  );
                },
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Lupa Kata Sandi?',
                    style: TextStyle(
                      color: Color(0xFF00A2E9),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              PrimaryButton(text: 'Masuk', onPressed: () {}),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'atau masuk dengan',
                      style: TextStyle(color: Color(0xFF757575), fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              const SizedBox(height: 24),

              SocialButton(
                text: 'Google',
                iconUrl: googleIconUrl,
                onPressed: () {},
              ),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum punya akun? ',
                    style: TextStyle(color: Color(0xFF757575), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Daftar Sekarang',
                      style: TextStyle(
                        color: Color(0xFF00A2E9),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
