import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/models/terms_model.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/terms_card.dart';

class TermsConditionsPage extends StatelessWidget {
  final List<TermsSection> sections;
  final VoidCallback onAccept;

  const TermsConditionsPage({
    super.key,
    required this.sections,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    print("Sections Count = ${sections.length}");

    return Scaffold(
      backgroundColor: const Color(0xFF1B1B4A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.verified_user_outlined,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Terms and Conditions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Please read and accept",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.separated(
                  itemCount: sections.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final item = sections[index];

                    return TermsCard(
                      title: item.title,
                      description: item.description,
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 180,
                height: 55,
                child: ElevatedButton(
                  onPressed: onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C55D7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "I accept",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
