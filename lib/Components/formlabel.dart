import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String label;

  const FormLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF212121),
        ),
      ),
    );
  }
}