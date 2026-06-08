import 'package:vyaparnet/features/auth/presentation/models/review_model.dart';

class RoomDetailModel {
  final String title;
  final String address;
  final String description;
  final String price;

  final List<String> images;
  final List<String> facilities;
  final List<ReviewModel> reviews;

  const RoomDetailModel({
    required this.title,
    required this.address,
    required this.description,
    required this.price,
    required this.images,
    required this.facilities,
    required this.reviews,
  });
}
