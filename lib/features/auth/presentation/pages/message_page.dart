import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/dashboard_bottom_nav.dart';
import 'package:vyaparnet/features/auth/presentation/models/chat_model.dart';
import 'package:vyaparnet/features/data/messages.dart';
import 'package:vyaparnet/features/auth/presentation/pages/Create chat_details_page.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  int selectedTab = 0;

  final List<String> notifications = [];

  Widget buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.forum_outlined, size: 100, color: Color(0xff4D5BCB)),
          SizedBox(height: 20),
          Text(
            "You haven't got any message",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildChatList() {
    if (chats.isEmpty) {
      return buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(chat.image),
          ),
          title: Text(
            chat.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            chat.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                chat.time,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),

              if (chat.unread)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xff4D5BCB),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChatDetailsPage(chat: chat)),
            );
          },
        );
      },
    );
  }

  Widget buildNotificationList() {
    if (notifications.isEmpty) {
      return buildEmptyState();
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(notifications[index]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),

      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 1),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xff1E1D57),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: const Text(
                'Message',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xffECEEF6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedTab == 0
                              ? const Color(0xff4D5BCB)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          'Chat',
                          style: TextStyle(
                            color: selectedTab == 0
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedTab == 1
                              ? const Color(0xff4D5BCB)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          'Service',
                          style: TextStyle(
                            color: selectedTab == 1
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: selectedTab == 0
                  ? buildChatList()
                  : buildNotificationList(),
            ),
          ],
        ),
      ),
    );
  }
}
