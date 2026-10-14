import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController txtController;
  final double cornerRadius;
  final TextInputType keyboardType;
  final bool obscureText; // Tambahan opsional untuk password

  const CustomTextfield({
    super.key,
    required this.hint,
    required this.txtController,
    this.cornerRadius = 10.0,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      keyboardType: keyboardType,
      obscureText: obscureText, // Supaya password berupa titik-titik
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
      ),
    );
  }
}