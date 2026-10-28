import 'package:aplication_project/menu/history.dart';
import 'package:aplication_project/menu/homedrawer.dart';
import 'package:aplication_project/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuDrawerController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> listPages = [
    const profilepage(),
    const historypage(),
    const homepage(),
  ];
}