import 'package:flutter/material.dart';

class ReferralScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String hintText;
  final String continueText;
  final String skipText;

  final VoidCallback? onSkip;
  final Function(String referralCode)? onContinue;

  const ReferralScreen({
    super.key,
    this.title = "Referral Code",
    this.subtitle = "Add Your referral Id",
    this.hintText = "Your referral phone number here",
    this.continueText = "Continue",
    this.skipText = "Skip",
    this.onSkip,
    this.onContinue,
  });

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1A184A),
      body: SafeArea(
        child: Stack(
          children: [
            /// Bottom City Background
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/city_bg.png",
                fit: BoxFit.cover,
                height: size.height * 0.12,
              ),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.06),

                  /// Top Icon
                  Icon(
                    Icons.group_add_outlined,
                    color: const Color(0xFFF2B86A),
                    size: size.width * 0.12,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: size.height * 0.06),

                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            widget.subtitle,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        const Text(
                          "Referral Code",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF2A295A),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: widget.hintText,
                            filled: true,
                            fillColor: const Color(0xFFF6F6F8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        PrimaryButton(
                          text: widget.continueText,
                          onTap: () {
                            widget.onContinue?.call(_controller.text.trim());
                          },
                        ),

                        const SizedBox(height: 16),

                        SecondaryButton(
                          text: widget.skipText,
                          onTap: widget.onSkip,
                        ),
                      ],
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

/// Continue Button
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const PrimaryButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3F4CCF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// Skip Button
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const SecondaryButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD9D9D9),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
