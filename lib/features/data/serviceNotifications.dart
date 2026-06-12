import 'package:vyaparnet/features/auth/presentation/models/ServiceNotification.dart';

final List<ServiceNotification> serviceNotifications = [
  ServiceNotification(
    image: "assets/images/room1.webp",
    title: "Your booking has been completed",
    time: "3 hours ago",
    unread: true,
    isOffer: false,
  ),

  ServiceNotification(
    image: "assets/images/room2.webp",
    title: "Your booking has been cancelled",
    time: "3 hours ago",
    unread: true,
    isOffer: false,
  ),

  ServiceNotification(
    image: "assets/images/gift.jpg",
    title: "50% off for all booking",
    time: "3 hours ago",
    unread: false,
    isOffer: true,
  ),

  ServiceNotification(
    image: "assets/images/gift.jpg",
    title: "No deposit fee at all from 3th - 6th June",
    time: "3 hours ago",
    unread: false,
    isOffer: true,
  ),
];
