import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/pages/room_detail_page.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/dashboard_bottom_nav.dart';
import 'favorites.dart';

class LikedRoomsScreen extends StatelessWidget {
  const LikedRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 3),
      appBar: AppBar(title: const Text('Liked Rooms')),
      body: ListView.builder(
        itemCount: FavoriteRooms.rooms.length,
        itemBuilder: (context, index) {
          final room = FavoriteRooms.rooms[index];

          return ListTile(
            leading: const Icon(Icons.favorite),
            onTap: () {
              onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RoomDetailPage()),
              );
            },
            title: Text(room['title']!),
            subtitle: Text(room['price']!),
          );
        },
      ),
    );
  }
}
