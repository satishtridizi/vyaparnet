import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatDetailsPage extends StatelessWidget {
  final ChatModel chat;

  const ChatDetailsPage({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xff1E1D57),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),

                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(chat.image),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      chat.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _receiverMessage("Hi there, will you come in time?"),

                  _senderMessage("Yes, I will"),

                  _receiverMessage(
                    "Thanks a lot. We also have different services like free wifi, sauna and spa",
                  ),

                  _senderMessage("Sound great. Where can I contact?"),

                  _receiverMessage("Please tell the receptionist"),

                  _senderMessage("Thank you"),

                  _receiverMessage(
                    "You're welcome and have a good day. See you soon!",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _receiverMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: const Color(0xffF1F3FA),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _senderMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: const Color(0xff9BB9E6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
