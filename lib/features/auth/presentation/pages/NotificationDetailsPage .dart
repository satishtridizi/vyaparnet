import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyaparnet/features/auth/presentation/models/ServiceNotification.dart';

class NotificationDetailsPage extends StatelessWidget {
  final ServiceNotification notification;

  const NotificationDetailsPage({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xff1E1D57),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Notification",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      child: Image.asset(
                        notification.image,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification.isOffer
                                ? "Special offer, 50% off for all service from 3th to 6th June"
                                : notification.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2B2B43),
                              height: 1.4,
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Our fancy room with minimalism decoration will make you feel like home! We have an area for cooking and a cafe shop at ground floor. 24/7 security with our guards at front door will make you feel safe all the time.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff6E7191),
                              height: 1.8,
                            ),
                          ),

                          const SizedBox(height: 35),

                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16),
                                  onTap: () async {
                                    await Clipboard.setData(
                                      const ClipboardData(text: 'NVC355'),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Coupon code copied'),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 55,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF3F4F8),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Text(
                                      "NVC355",
                                      style: TextStyle(
                                        color: Color(0xffA0A3BD),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 16),

                              SizedBox(
                                width: 110,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Offer saved successfully',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff4D5BCB),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}
