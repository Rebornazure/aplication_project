import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextfield extends StatelessWidget {
  // list variabel parameter yang digunakan
  // untuk diisikan kegtika dipanggil
  final String myHint;
  final TextEditingController txtController;
  final double radius;
  final IconData? icon;
  final bool numberOnly;
  final int? maxLength;
  final TextInputType? keyboardType;

  const MyTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    required this.radius,
    this.icon,
    this.numberOnly = false,
    this.maxLength,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: txtController,
        maxLength: maxLength,
        keyboardType: numberOnly ? TextInputType.number : keyboardType,
        inputFormatters: numberOnly
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        decoration: InputDecoration(
          labelText: myHint,
          hintText: myHint,
          counterText: '',
          filled: true,
          fillColor: Colors.grey.shade100,
          prefixIcon: icon != null ? Icon(icon) : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}