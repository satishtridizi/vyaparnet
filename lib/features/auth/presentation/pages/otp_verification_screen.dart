import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'dart:async';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int remainingSeconds = 30;
  bool canResend = false;

  Timer? timer;
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  @override
  void dispose() {
    timer?.cancel();

    for (final controller in otpControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  void resendOtp() {
    if (!canResend) return;

    // TODO: API call later

    debugPrint("New OTP Generated");

    startTimer();
  }

  Widget buildOtpBox(int index) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextField(
        controller: otpControllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xFFF3F3F7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  void startTimer() {
    timer?.cancel();

    setState(() {
      remainingSeconds = 30;
      canResend = false;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        setState(() {
          canResend = true;
        });

        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B4A),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFA726),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.verified_user_outlined,
                        color: Color(0xFFFFA726),
                        size: 32,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Verify",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 35),

                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Please enter the verification code sent to your phone number",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 24),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Your code here",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              4,
                              (index) => buildOtpBox(index),
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                canResend
                                    ? "OTP Expired"
                                    : "Expires in ${remainingSeconds}s",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),

                              GestureDetector(
                                onTap: resendOtp,
                                child: Text(
                                  "Resend",
                                  style: TextStyle(
                                    color: canResend
                                        ? AppColors.primary
                                        : Colors.grey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {
                                final otp = otpControllers
                                    .map((e) => e.text)
                                    .join();

                                print("OTP: $otp");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: const Text(
                                "Confirm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.25,
                child: Image.asset(
                  'assets/images/city.png',
                  fit: BoxFit.cover,
                  height: 90,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
