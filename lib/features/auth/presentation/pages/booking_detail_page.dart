import 'package:flutter/material.dart';

class BookingDetailPage extends StatefulWidget {
  BookingDetailPage({super.key});

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();

  static Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),

          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  int selectedFacility = -1;
  final List<String> facilities = [
    'Elevator',
    'Hot Water',
    'Cooking Place',
    'Parking',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D57),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    'Anu Furniture',
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ROOM IMAGE CARD
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.asset(
                              "assets/images/room1.webp",
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Positioned(
                            left: 20,
                            bottom: 45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Service Room",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    "\$12.50/1 hour",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Positioned(
                            bottom: 25,
                            right: 20,
                            child: Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // PAGE DOTS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: index == 0
                                ? const Color(0xff4D5BCB)
                                : Colors.white54,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white70,
                          ),

                          const SizedBox(width: 8),

                          const Expanded(
                            child: Text(
                              "23 Sun View Rd, Little Town, CA, 23424",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          const Icon(Icons.access_time, color: Colors.white70),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: const [
                          Icon(Icons.bed_outlined, color: Colors.white70),
                          SizedBox(width: 6),
                          Text("1", style: TextStyle(color: Colors.white70)),

                          SizedBox(width: 40),

                          Icon(Icons.bathtub_outlined, color: Colors.white70),
                          SizedBox(width: 6),
                          Text("1", style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // WHITE SECTION
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
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Booking detail",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            const SizedBox(height: 20),

                            BookingDetailPage.buildRow("Deposit", "\$12.50"),
                            BookingDetailPage.buildRow(
                              "Booking time",
                              "12:00 am",
                            ),
                            BookingDetailPage.buildRow(
                              "Booking date",
                              "12/12/2021",
                            ),
                            BookingDetailPage.buildRow("Method", "Credit card"),

                            const SizedBox(height: 30),

                            const Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            const SizedBox(height: 12),

                            const Text(
                              "Our fancy room with minimalism decoration will make you feel like home! We have an area for cooking and a cafe shop at ground floor. 24/7 security with our guards at front door will make you feel safe all the time.",
                              style: TextStyle(
                                color: Color(0xff6F748C),
                                height: 1.8,
                              ),
                            ),

                            const SizedBox(height: 30),

                            const Text(
                              "Facilities",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                facilityBox(0, Icons.elevator, "Elevator"),
                                facilityBox(
                                  1,
                                  Icons.water_drop_outlined,
                                  "Hot water",
                                ),

                                facilityBox(
                                  2,
                                  Icons.soup_kitchen_outlined,
                                  "Cooking place",
                                ),

                                facilityBox(
                                  3,
                                  Icons.local_parking_outlined,
                                  "Parking",
                                ),
                              ],
                            ),

                            const SizedBox(height: 35),

                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff4D5BCB),
                                      minimumSize: const Size(
                                        double.infinity,
                                        55,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: const Text(
                                      "Chat with host",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 14),

                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffF5F6FB),
                                      minimumSize: const Size(
                                        double.infinity,
                                        55,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: const Text(
                                      "Cancel booking",
                                      style: TextStyle(
                                        color: Color(0xff6F748C),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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

  Widget facilityBox(int index, IconData icon, String title) {
    bool selected = selectedFacility == index;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        setState(() {
          selectedFacility = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xff4D5BCB) : const Color(0xffF5F6FB),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: selected ? Colors.white : const Color(0xffB7BBCD),
            ),

            const SizedBox(width: 8),

            Text(
              title,
              style: TextStyle(
                color: selected ? Colors.white : const Color(0xff6F748C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
