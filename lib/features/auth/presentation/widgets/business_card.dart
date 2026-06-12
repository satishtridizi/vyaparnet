import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/models/business_model.dart';

class BusinessCard extends StatelessWidget {
  final BusinessModel business;

  const BusinessCard({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF5F6FC),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              business.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  business.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  business.category,
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.call_outlined, size: 20),
                    const SizedBox(width: 4),

                    InkWell(
                      onTap: () {
                        debugPrint("Call clicked");
                      },
                      child: const Text(
                        "Call",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),

                    const SizedBox(width: 20),

                    const Icon(Icons.message_outlined, size: 20),
                    const SizedBox(width: 4),

                    InkWell(
                      onTap: () {
                        debugPrint("Message clicked");
                      },
                      child: const Text(
                        "Message",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${business.distance} km",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),

                  const SizedBox(width: 4),

                  Text(
                    business.rating.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
