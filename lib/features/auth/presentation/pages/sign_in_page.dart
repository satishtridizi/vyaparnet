import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/auth_card.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/city_background.dart';
import '../../../../../core/theme/app_colors.dart';
import 'package:vyaparnet/features/auth/presentation/pages/signup_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            const CityBackground(),

            SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Spacer(),

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

                      const SizedBox(height: 24),

                      const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 32),

                      AuthCard(
                        mode: AuthMode.signIn,
                        onAuthSwitch: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupPage(),
                            ),
                          );
                        },
                      ),

                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
