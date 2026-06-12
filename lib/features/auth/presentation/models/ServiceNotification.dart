class ServiceNotification {
  final String image;
  final String title;
  final String time;
  final bool isUnread;
  final bool isOffer;

  ServiceNotification({
    required this.image,
    required this.title,
    required this.time,
    this.isUnread = false,
    this.isOffer = false,
  });
}
