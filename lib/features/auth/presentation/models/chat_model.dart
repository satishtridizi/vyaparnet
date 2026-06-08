class ChatModel {
  final String image;
  final String name;
  final String lastMessage;
  final String time;
  final bool unread;

  ChatModel({
    required this.image,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unread = false,
  });
}
