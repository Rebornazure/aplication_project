import 'package:aplication_project/controller/main_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final menucontroller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: menucontroller.selectedIndex.value,
          children: menucontroller.listpages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: menucontroller.selectedIndex.value,
          onTap: menucontroller.changepage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
