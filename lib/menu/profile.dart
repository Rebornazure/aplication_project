import 'package:flutter/material.dart';
import 'package:aplication_project/Components/stat_card.dart';
import 'package:aplication_project/Components/menu_tile.dart'; 

class profilepage extends StatelessWidget {
  const profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500',
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, size: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Galuh Adjie Abiyyu Akbar",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "galuhadjiabiyyuakbar@email.com",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Row(
              children: [
                Expanded(child: StatCard(title: "Trips", value: "12")),
                SizedBox(width: 12),
                Expanded(child: StatCard(title: "Countries", value: "08")),
                SizedBox(width: 12),
                Expanded(child: StatCard(title: "Memories", value: "47")),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              "General",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            MenuTile(
              icon: Icons.auto_awesome,
              title: "AI Memory",
              onTap: () {},
            ),
            MenuTile(
              icon: Icons.location_on_outlined,
              title: "Saved Places",
              onTap: () {},
            ),
            const SizedBox(height: 20),

            const Text(
              "Preferences",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            MenuTile(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              trailing: Switch(
                value: false,
                onChanged: (val) {},
              ),
            ),
            MenuTile(
              icon: Icons.notifications_outlined,
              title: "Notifications",
              onTap: () {},
            ),
            MenuTile(
              icon: Icons.translate,
              title: "Language",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}