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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      SizedBox(
                        height: 280,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: images.length,
                          onPageChanged: (index) {
                            setState(() {
                              currentImage = index;
                            });
                          },
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

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
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Service Room",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text("\$12.50 / Hour"),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                "23 Sun View Rd, Little Town, CA, 23424",
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Our fancy room with minimalism decoration will make you feel like home. We have an area for cooking and a cafe shop at ground floor. 24/7 security with our guards at front door will make you feel safe all the time.",
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Facilities",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            ActionChip(
                              label: const Text("Elevator"),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Elevator facility selected"),
                                  ),
                                );
                              },
                            ),

                            ActionChip(
                              label: const Text("Hot water"),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Hot water facility selected",
                                    ),
                                  ),
                                );
                              },
                            ),

                            ActionChip(
                              label: const Text("Cooking place"),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Cooking place facility selected",
                                    ),
                                  ),
                                );
                              },
                            ),

                            ActionChip(
                              label: const Text("Parking"),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Parking facility selected"),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Comments (234)",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.star, color: Colors.orange),
                            Text("4.5"),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      _buildReview(
                        "Lisa Monica",
                        "So in love with this room. My host is very friendly and helpful.",
                        "5.0",
                      ),

                      _buildReview(
                        "Melia Strim",
                        "The bath need fixing soon",
                        "4.0",
                      ),

                      _buildReview(
                        "Rachel Chu",
                        "I'm quite confident that every people with love this place like I do.",
                        "5.0",
                      ),

                      const SizedBox(height: 100),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("⭐ $rating"),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xffF4F6FB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(comment),
          ),
        ],
      ),
    );
  }
}
