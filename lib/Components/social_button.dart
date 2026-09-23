import 'package:flutter/material.dart';
import 'package:aplication_project/Components/custom_image.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String iconUrl;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.iconUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
children: [
            CustomImage(
              imageUrl: iconUrl,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
              fallbackWidget: const Icon(
                Icons.g_mobiledata,
                size: 28,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}