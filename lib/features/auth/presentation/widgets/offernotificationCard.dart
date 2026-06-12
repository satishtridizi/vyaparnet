import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String imageUrl;
  final String code;
  final VoidCallback onSave;

  const NotificationCard({
    super.key,
    required this.imageUrl,
    required this.code,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Image.network(
              imageUrl,
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 22),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "Special offer, 50% off for all service from 3th to 6th June",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff33334F),
                height: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 18),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "Our fancy room with minimalism decoration will make you feel like home! "
              "We have an area for cooking and a cafe shop at ground floor. "
              "24/7 security with our guards at front door will make you feel safe all the time.",
              style: TextStyle(
                fontSize: 17,
                color: Color(0xff6F7185),
                height: 1.7,
              ),
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      debugPrint("Coupon clicked");
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 56,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        code,
                        style: const TextStyle(
                          color: Color(0xff8A8A98),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                SizedBox(
                  width: 110,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4B52D4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
