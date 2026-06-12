import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/models/onboarding_model.dart';

import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/pages/sign_in_page.dart';
import 'package:vyaparnet/features/auth/presentation/pages/signup_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/onboarding1.jpg",
      "title": "Grow your Network, Business & Revenue",
      "desc":
          "We provide you with a variant of businesses and referrals to each other just like yours.",
    },
    {
      "image": "assets/images/onboarding2.jpg",
      "title": "Lead generation and scale it effectively",
      "desc":
          "As your business network expands, stronger lead generation opportunities help create meaningful connections.",
    },
    {
      "image": "assets/images/onboarding3.jpg",
      "title": "It's a game changer that transforms businesses and lives.",
      "desc":
          "Post instant updates to business members and connect with the right customers for the right deals at the right time.",
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Colors.blue.shade300
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        Expanded(
                          flex: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              pages[index]["image"]!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        Text(
                          pages[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4048C8),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Container(width: 90, height: 4, color: Colors.orange),

                        const SizedBox(height: 30),

                        Text(
                          pages[index]["desc"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),

                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                            (i) => buildDot(i),
                          ),
                        ),

                        const SizedBox(height: 25),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: currentPage == pages.length - 1
                  ? Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignupPage(),
                                  ),
                                );
                              },
                              child: const Text("Sign Up"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignInPage(),
                                  ),
                                );
                              },
                              child: const Text("Sign In"),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: currentPage == 0 ? null : previousPage,
                              child: const Text("Back"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: nextPage,
                              child: const Text("Next"),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
