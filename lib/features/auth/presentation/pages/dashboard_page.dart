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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner
                    SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: PageView(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              "assets/images/banner1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Categories
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.count(
                        crossAxisCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.9,
                        children: [
                          categoryItem(
                            "Restaurant",
                            "assets/icons/restaurant.png",
                          ),
                          categoryItem("Retail", "assets/icons/retail.png"),
                          categoryItem("Saloon", "assets/icons/saloon.png"),
                          categoryItem("Events", "assets/icons/events.png"),
                          categoryItem("Fitness", "assets/icons/fitness.png"),
                          categoryItem(
                            "Education",
                            "assets/icons/education.png",
                          ),
                          categoryItem(
                            "Real Estate",
                            "assets/icons/estate.png",
                          ),
                          categoryItem("Automobile", "assets/icons/car.png"),
                          categoryItem("Tours", "assets/icons/tours.png"),
                          categoryItem("Show More", "assets/icons/more.png"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Near to you",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    ListView.builder(
                      itemCount: businesses.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryItem(String title, String image) {
  return Column(
    children: [
      Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xffF2F3F7),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(image),
        ),
      ),

      const SizedBox(height: 6),

      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 11),
      ),
    ],
  );
}
