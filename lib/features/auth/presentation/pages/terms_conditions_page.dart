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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                const Icon(
                  Icons.verified_user_outlined,
                  color: Color(0xffF4B266),
                  size: 70,
                ),

                const SizedBox(height: 12),

                const Text(
                  "Terms and Conditions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Please read and accept",
                  style: TextStyle(color: Color(0xffA9AEC4), fontSize: 14),
                ),

                const SizedBox(height: 16),

                Column(
                  children: [
                    ...sections.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: TermsCard(
                          title: item.title,
                          description: item.description,
                        ),
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
