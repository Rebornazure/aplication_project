import 'package:aplication_project/menu/history.dart';
import 'package:aplication_project/menu/home.dart';
import 'package:aplication_project/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changepage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listpages = [homepage(), historypage(), profilepage()];
}