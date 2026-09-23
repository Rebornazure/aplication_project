import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KalkulatorController extends GetxController {
  var hasilhitung = 0.0.obs;

  // Helper untuk merapikan tampilan angka (menghilangkan .0 jika angka bulat)
  String _formatHasil(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  // Method Snackbar Dinamis sesuai Jenis Operasi
  void _showCustomSnackbar({
    required String title,
    required String message,
    required Color bgColor,
    required IconData iconData,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: bgColor,
      colorText: Colors.white,
      icon: Icon(iconData, color: Colors.white, size: 28),
      borderRadius: 12,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  void tambah(double a1, double a2) {
    double hasiltambah = a1 + a2;
    hasilhitung.value = hasiltambah;
    _showCustomSnackbar(
      title: "Penjumlahan",
      message: "Hasil dari ${_formatHasil(a1)} + ${_formatHasil(a2)} = ${_formatHasil(hasiltambah)}",
      bgColor: Colors.green.shade600,
      iconData: Icons.add_circle_outline,
    );
  }

  void kurang(double a1, double a2) {
    double hasilkurang = a1 - a2;
    hasilhitung.value = hasilkurang;
    _showCustomSnackbar(
      title: "Pengurangan",
      message: "Hasil dari ${_formatHasil(a1)} - ${_formatHasil(a2)} = ${_formatHasil(hasilkurang)}",
      bgColor: Colors.orange.shade700,
      iconData: Icons.remove_circle_outline,
    );
  }

  void kali(double a1, double a2) {
    double hasilkali = a1 * a2;
    hasilhitung.value = hasilkali;
    _showCustomSnackbar(
      title: "Perkalian",
      message: "Hasil dari ${_formatHasil(a1)} × ${_formatHasil(a2)} = ${_formatHasil(hasilkali)}",
      bgColor: Colors.indigo.shade600,
      iconData: Icons.cancel_outlined, // Atau Icons.close untuk lambang kali
    );
  }

  void bagi(double a1, double a2) {
    if (a2 == 0) {
      _showCustomSnackbar(
        title: "Peringatan",
        message: "Tidak bisa membagi dengan angka nol (0)!",
        bgColor: Colors.red.shade600,
        iconData: Icons.warning_amber_rounded,
      );
      return;
    }
    
    double hasilbagi = a1 / a2;
    hasilhitung.value = hasilbagi;
    _showCustomSnackbar(
      title: "Pembagian",
      message: "Hasil dari ${_formatHasil(a1)} ÷ ${_formatHasil(a2)} = ${_formatHasil(hasilbagi)}",
      bgColor: Colors.teal.shade600,
      iconData: Icons.pie_chart_outline,
    );
  }
}