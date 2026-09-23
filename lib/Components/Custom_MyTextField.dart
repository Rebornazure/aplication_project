import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController txtController;
  final double cornerRadius;
  final TextInputType keyboardType;

  const CustomTextfield({
    super.key,
    required this.hint,
    required this.txtController,
    this.cornerRadius = 10.0,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      keyboardType: keyboardType,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
      ),
    );
  }
}