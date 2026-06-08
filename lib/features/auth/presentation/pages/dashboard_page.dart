import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/business_card.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/dashboard_bottom_nav.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/dashboard_header.dart';
import 'package:vyaparnet/features/data/dummy_businesses.dart';
import 'package:vyaparnet/features/auth/presentation/models/dashboard_header_model.dart';
import 'package:vyaparnet/features/auth/presentation/pages/room_detail_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headerData = DashboardHeaderModel(
      userName: 'John',
      location: 'Madhapur, Hyderabad',
      unreadNotifications: 3,
      searchHint: 'Search Businesses',
      latitude: '17.4483',
      longitude: '78.3915',
    );

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 0),

      body: SafeArea(
        child: Column(
          children: [
            DashboardHeader(data: headerData),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Near to you",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Expanded(
                        child: ListView.builder(
                          itemCount: businesses.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RoomDetailPage(),
                                  ),
                                );
                              },
                              child: BusinessCard(business: businesses[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
