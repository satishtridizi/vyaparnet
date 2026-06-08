import 'package:vyaparnet/features/auth/presentation/models/review_model.dart';
import 'package:vyaparnet/features/auth/presentation/models/room_detail_model.dart';

final room = RoomDetailModel(
  title: "Service Room",

  address: "23 Sun View Rd, Little Town, CA, 23424",

  description:
      "Our fancy room with minimalism decoration will make you feel like home.",

  price: "\$12.50/hr",

  images: [
    "assets/images/room1.jpg",
    "assets/images/room2.jpg",
    "assets/images/room3.jpg",
  ],

  facilities: ["Elevator", "Hot Water", "Cooking Place", "Parking"],

  reviews: [
    ReviewModel(
      userName: "Lisa Monica",
      userImage: "assets/images/user1.jpg",
      rating: 5,
      comment: "So in love with this room.",
    ),

    ReviewModel(
      userName: "Melia Strim",
      userImage: "assets/images/user2.jpg",
      rating: 4,
      comment: "The bath needs fixing soon.",
    ),
  ],
);
