class PropertyModel {
  final String id;
  final String title;
  final String image;
  bool isLiked;

  PropertyModel({
    required this.id,
    required this.title,
    required this.image,
    this.isLiked = false,
  });
}
