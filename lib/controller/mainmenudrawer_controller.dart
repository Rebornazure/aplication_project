import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplication_project/menu/home.dart';
import 'package:aplication_project/menu/history.dart';
import 'package:aplication_project/menu/profile.dart';
import 'package:aplication_project/menu/homedart_api.dart';

class MainMenuDrawerController extends GetxController {
  final RxInt selectedIndex = 3.obs;

  final List<Widget> listPages = [
    const homepage(),
    const historypage(),
    const profilepage(),
    const apihomedart(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}