import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/dashboard_bottom_nav.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 3),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1D57),
        title: const Text("Favorites", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/room1.webp",
                width: 60,
                fit: BoxFit.cover,
              ),
              title: const Text("The Wooden House"),
              subtitle: const Text("Furniture"),
              trailing: const Icon(Icons.favorite, color: Colors.red),
            ),
          ),

          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/room2.webp",
                width: 60,
                fit: BoxFit.cover,
              ),
              title: const Text("Anu Furnitures"),
              subtitle: const Text("Home Decor"),
              trailing: const Icon(Icons.favorite, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
