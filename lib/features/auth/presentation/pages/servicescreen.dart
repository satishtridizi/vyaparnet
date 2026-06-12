import 'package:flutter/material.dart';

class ServiceItem {
  final String title;
  final String time;
  final String image;
  final bool isOffer;
  final bool unread;

  ServiceItem({
    required this.title,
    required this.time,
    required this.image,
    this.isOffer = false,
    this.unread = false,
  });
}

final List<ServiceItem> serviceList = [
  ServiceItem(
    title: 'Premium Support',
    time: '2:30 PM',
    image: 'assets/images/service1.png',
    unread: true,
  ),
  ServiceItem(
    title: 'Special Offer',
    time: '1:15 PM',
    image: '',
    isOffer: true,
  ),
  ServiceItem(
    title: 'Account Update',
    time: '11:45 AM',
    image: 'assets/images/service2.png',
  ),
];

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            height: 130,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff20204A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            alignment: Alignment.center,
            child: const SafeArea(
              child: Text(
                "Message",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Tab Switcher
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: const Text(
                      "Chat",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xff3D4FD7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Service",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Dynamic List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: serviceList.length,
              itemBuilder: (context, index) {
                final item = serviceList[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      // Image / Icon
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: item.isOffer
                            ? Container(
                                height: 65,
                                width: 65,
                                color: const Color(0xff3D4FD7),
                                child: const Icon(
                                  Icons.card_giftcard,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              )
                            : Image.asset(
                                item.image,
                                height: 65,
                                width: 65,
                                fit: BoxFit.cover,
                              ),
                      ),

                      const SizedBox(width: 12),

                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.time,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Unread Dot
                      if (item.unread)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
