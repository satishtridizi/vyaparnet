import 'package:flutter/material.dart';

class BookingDetailPage extends StatelessWidget {
  BookingDetailPage({super.key});
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
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/room1.webp',
                          height: 220,
                          width: 320,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Booking Detail',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 20),

                            buildRow('Deposit', '\$12.50'),

                            buildRow('Booking Time', '12:00 am'),

                            buildRow('Booking Date', '12/12/2021'),

                            buildRow('Method', 'Credit Card'),

                            const SizedBox(height: 20),

                            const Text(
                              'Description',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              'Our fancy room with minimalism decoration will make you feel like home.',
                            ),

                            const SizedBox(height: 20),

                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: facilities.map((facility) {
                                return ActionChip(
                                  label: Text(facility),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('$facility clicked'),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),

                            const SizedBox(height: 30),

                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff3F4CCB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),

                                    child: const Text(
                                      'Chat with host',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},

                                    child: const Text('Cancel booking'),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),
                          ],
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
