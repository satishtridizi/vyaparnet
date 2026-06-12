import 'package:vyaparnet/features/auth/presentation/models/notification_model.dart';

final List<NotificationModel> notifications = [
  NotificationModel(
    tag: "Booking",
    imageUrl: "assets/images/room1.webp",
    description:
        "Your booking has been completed. We hope you had a great experience with us. Please share your feedback with us.",
    date: "3 hours ago",

    title: "Your booking has been completed",
  ),

  NotificationModel(
    tag: "Promotion",
    imageUrl: "assets/images/room2.webp",
    description: "Get 50% off on all your bookings. Limited time offer!",
    date: "3 hours ago",

    title: "50% off for all booking",
  ),
];
