import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/models/profile_model.dart';
import 'package:vyaparnet/features/auth/presentation/pages/dashboard_page.dart';
import 'package:vyaparnet/features/auth/presentation/pages/message_page.dart';
import 'package:vyaparnet/features/auth/presentation/pages/profile_page.dart';

class DashboardBottomNav extends StatelessWidget {
  final int selectedIndex;

  const DashboardBottomNav({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xff1E1D57),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(context, icon: Icons.home, index: 0),

            _navItem(context, icon: Icons.chat_bubble_outline, index: 1),

            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70, width: 2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),

            _navItem(context, icon: Icons.favorite_border, index: 3),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfilePage(
                      profile: ProfileModel(
                        name: 'John Doe',
                        points: 1200,
                        imageUrl: 'https://i.pravatar.cc/150',
                        phone: '1234567890',
                        email: 'johndoe@example.com',
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: selectedIndex == 4
                      ? Border.all(color: Colors.white, width: 2)
                      : null,
                  image: const DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/150'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required IconData icon,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DashboardPage()),
          );
        }

        if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MessagePage()),
          );
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: isSelected
            ? const BoxDecoration(
                color: Color(0xff3B3277),
                shape: BoxShape.circle,
              )
            : null,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
