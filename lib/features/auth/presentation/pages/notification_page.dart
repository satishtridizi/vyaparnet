import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/dashboard_bottom_nav.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),

      bottomNavigationBar: const DashboardBottomNav(),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
            decoration: const BoxDecoration(
              color: Color(0xff1E1D57),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.remove, color: Colors.white),
                  ),
                ),

                const Expanded(
                  child: Center(
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                Text('Yesterday', textAlign: TextAlign.center),

                SizedBox(height: 16),

                NotificationCard(),

                SizedBox(height: 16),

                NotificationCard(),

                SizedBox(height: 30),

                Text('Wednesday', textAlign: TextAlign.center),

                SizedBox(height: 16),

                NotificationCard(),

                SizedBox(height: 16),

                NotificationCard(),

                SizedBox(height: 16),

                NotificationCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
