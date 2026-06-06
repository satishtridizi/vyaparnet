import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/auth_card.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/city_background.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D57),
      body: SafeArea(
        child: Stack(
          children: [
            const CityBackground(),

            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Image.asset("assets/logo.png", height: 80),

                    const SizedBox(height: 12),

                    const Text(
                      "VyaparNet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 32),

                    AuthCard(
                      mode: AuthMode.signUp,
                      onAuthSwitch: () {
                        Navigator.pop(context);
                      },
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
