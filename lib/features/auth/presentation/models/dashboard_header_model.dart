class DashboardHeaderModel {
  final String userName;
  final String location;
  final int unreadNotifications;

  final String? latitude;
  final String? longitude;

  final String searchHint;

  const DashboardHeaderModel({
    required this.userName,
    required this.location,
    required this.unreadNotifications,
    required this.searchHint,
    this.latitude,
    this.longitude,
  });

  DashboardHeaderModel copyWith({
    String? userName,
    String? location,
    int? unreadNotifications,
    String? latitude,
    String? longitude,
    String? searchHint,
  }) {
    return DashboardHeaderModel(
      userName: userName ?? this.userName,
      location: location ?? this.location,
      unreadNotifications: unreadNotifications ?? this.unreadNotifications,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      searchHint: searchHint ?? this.searchHint,
    );
  }
}
