
import 'package:flutter/material.dart';
import 'package:aplication_project/controller/mainmenudrawer_controller.dart';
import 'package:get/get.dart';

class MainMenuDrawer extends StatelessWidget {
  MainMenuDrawer({super.key});

  final MainMenuDrawerController menuDrawerController =
      Get.put(MainMenuDrawerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Surya STORE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 20, 234, 170),
        ),

        drawer: NavigationDrawer(
          selectedIndex: menuDrawerController.selectedIndex.value,
          onDestinationSelected: (index) {
            menuDrawerController.changeIndex(index);
            Navigator.pop(context);
          },
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(28, 24, 16, 16),
              child: Text(
                'MENU SURYA STORE',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: Text('Profile'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.history),
              selectedIcon: Icon(Icons.history),
              label: Text('History'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Home'),
            ),
          ],
        ),

        body: IndexedStack(
          index: menuDrawerController.selectedIndex.value,
          children: menuDrawerController.listPages.cast<Widget>(),
        ),
      ),
    );
  }
}
