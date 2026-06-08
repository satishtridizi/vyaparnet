import 'package:flutter/material.dart';

class RoomDetailPage extends StatelessWidget {
  const RoomDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Room")),
      body: const Center(child: Text("Room Details")),
    );
  }
}
