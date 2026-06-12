import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/models/ServiceNotification.dart';

class ServiceNotificationCard extends StatelessWidget {
  final ServiceNotification notification;
  final VoidCallback onTap;

  const ServiceNotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: const Color(0xffF5F5F8),
          borderRadius: BorderRadius.circular(18),
        ),

        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                notification.image,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff2B2B43),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    notification.time,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            if (notification.isUnread)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xffF4A259),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
