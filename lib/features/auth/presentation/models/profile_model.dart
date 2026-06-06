class ProfileModel {
  final String name;
  final String phone;
  final String email;
  final String imageUrl;
  final int points;

  const ProfileModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.imageUrl,
    required this.points,
  });

  ProfileModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? imageUrl,
    int? points,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      points: points ?? this.points,
    );
  }
}
