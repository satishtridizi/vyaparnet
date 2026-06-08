import 'package:flutter/material.dart';

class TermsCard extends StatelessWidget {
  final String title;
  final String description;

  const TermsCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xff6F748C),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff9EA3B6),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
