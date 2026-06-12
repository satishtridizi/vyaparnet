import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/pages/LikedRoomsScreen.dart';
import 'package:vyaparnet/features/auth/presentation/pages/LikedRoomsScreen.dart';
import 'package:vyaparnet/features/auth/presentation/pages/favorites.dart';

class RoomDetailPage extends StatefulWidget {
  const RoomDetailPage({super.key});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  final PageController _pageController = PageController();

  int currentImage = 0;
  int selectedFilter = 0;
  bool isFavorite = false;

  final List<String> images = [
    'assets/images/bedroom.jpg',
    'assets/images/bedroom.jpg',
    'assets/images/bedroom.jpg',
    'assets/images/bedroom.jpg',
    'assets/images/bedroom.jpg',
  ];
  final List<Map<String, dynamic>> facilities = [
    {"icon": Icons.elevator_outlined, "title": "Elevator"},
    {"icon": Icons.water_drop_outlined, "title": "Hot water"},
    {"icon": Icons.soup_kitchen_outlined, "title": "Cooking place"},
    {"icon": Icons.local_parking_outlined, "title": "Parking"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D57),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xff1E1D57),
                borderRadius: BorderRadius.circular(14),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });

                  if (isFavorite) {
                    FavoriteRooms.rooms.add({
                      "title": "Service Room",
                      "price": "\$12.50 / Hour",
                    });
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Book Now Clicked')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4D5BCB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Book now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "Room",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            image: DecorationImage(
                              image: AssetImage(images[currentImage]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.black.withOpacity(.35),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Service Room",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Text(
                                      "\$12.50/1 hour",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),

                                  const SizedBox(height: 15),

                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.fullscreen,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentImage == index
                                  ? const Color(0xff4D5BCB)
                                  : Colors.white54,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "23 Sun View Rd, Little Town, CA, 23424",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(Icons.bed_outlined, color: Colors.white70),
                            SizedBox(width: 6),
                            Text("1", style: TextStyle(color: Colors.white)),

                            SizedBox(width: 25),

                            Icon(Icons.bathtub_outlined, color: Colors.white70),
                            SizedBox(width: 6),
                            Text("1", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),

                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4C4C70),
                                ),
                              ),

                              const SizedBox(height: 16),

                              const Text(
                                "Our fancy room with minimalism decoration will make you feel like home! We have an area for cooking and a cafe shop at ground floor. 24/7 security with our guards at front door will make you feel safe all the time.",
                                style: TextStyle(
                                  height: 1.8,
                                  color: Color(0xff6F748C),
                                ),
                              ),

                              const SizedBox(height: 30),

                              const Text(
                                "Facilities",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4C4C70),
                                ),
                              ),

                              const SizedBox(height: 18),

                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  _facility(
                                    "Elevator",
                                    Icons.elevator_outlined,
                                    () {
                                      print("Elevator clicked");
                                    },
                                  ),

                                  _facility(
                                    "Hot water",
                                    Icons.water_drop_outlined,
                                    () {
                                      print("Hot water clicked");
                                    },
                                  ),

                                  _facility(
                                    "Cooking place",
                                    Icons.soup_kitchen_outlined,
                                    () {
                                      print("Cooking clicked");
                                    },
                                  ),

                                  _facility(
                                    "Parking",
                                    Icons.local_parking_outlined,
                                    () {
                                      print("Parking clicked");
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Comments (234)",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff4C4C70),
                                    ),
                                  ),

                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffF4B266),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              Row(
                                children: [
                                  _filterChip("All", true),
                                  const SizedBox(width: 12),
                                  _filterChip("⭐ 4 to 5", false),
                                  const SizedBox(width: 12),
                                  _filterChip("⭐ 1 to 3", false),
                                ],
                              ),

                              const SizedBox(height: 25),

                              _buildReview(
                                "Lisa Monica",
                                "So in love with this room. My host is very friendly and helpful",
                                "5.0",
                              ),

                              _buildReview(
                                "Melia Strim",
                                "The bath need fixing soon",
                                "4.0",
                              ),

                              _buildReview(
                                "Rachel Chu",
                                "I'm quite confident that every people with love this place like I do",
                                "5.0",
                              ),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _pageButton(Icons.remove),
                                  const SizedBox(width: 15),

                                  const Text(
                                    "1",
                                    style: TextStyle(
                                      color: Color(0xff4D5BCB),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(width: 20),
                                  const Text("2"),
                                  const SizedBox(width: 20),
                                  const Text("3"),
                                  const SizedBox(width: 20),
                                  const Text("..."),
                                  const SizedBox(width: 20),
                                  const Text("6"),
                                  const SizedBox(width: 20),
                                  const Text("7"),

                                  const SizedBox(width: 15),

                                  _pageButton(Icons.remove),
                                ],
                              ),

                              const SizedBox(height: 80),
                            ],
                          ),
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

  Widget _buildReview(String name, String comment, String rating) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/profile/profile.png"),
              ),

              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xffF4B266),
                      ),
                      const SizedBox(width: 4),
                      Text(rating),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xffF4F6FB),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              comment,
              style: const TextStyle(color: Color(0xff4C4C70), height: 1.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _facility(String text, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xffF5F6FB),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: const Color(0xffA0A5BA)),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(color: Color(0xff6F748C))),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String text, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? const Color(0xffEAF1FF) : const Color(0xffF7F7FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? const Color(0xff4D5BCB) : const Color(0xff6F748C),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _pageButton(IconData icon) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffC8CCF5)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 18, color: const Color(0xff8A90C7)),
    );
  }
}
