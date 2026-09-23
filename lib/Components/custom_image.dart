import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? fallbackWidget;

  const CustomImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.fallbackWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return fallbackWidget ??
            const Icon(Icons.broken_image, size: 24, color: Colors.grey);
      },
    );
  }
}