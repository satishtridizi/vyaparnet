import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy & Policy')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text('Your privacy policy content will come here.'),
      ),
    );
  }
}
