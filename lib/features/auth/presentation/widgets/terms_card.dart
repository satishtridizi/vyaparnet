import 'package:flutter/material.dart';

class TermsCard extends StatelessWidget {
  final String title;
  final String description;

  const TermsCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff7B809B),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff9EA3B6),
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
