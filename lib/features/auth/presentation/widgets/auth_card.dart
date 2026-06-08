import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/pages/ResetPasswordScreen.dart';
import '../../../../core/theme/app_colors.dart';
import 'auth_text_field.dart';
import 'package:vyaparnet/features/auth/presentation/pages/dashboard_page.dart';
import 'package:flutter/services.dart';

enum AuthMode { signIn, signUp }

class AuthCard extends StatefulWidget {
  final AuthMode mode;
  final VoidCallback onAuthSwitch;
  final VoidCallback? onSignIn;

  const AuthCard({
    super.key,
    required this.mode,
    required this.onAuthSwitch,
    this.onSignIn,
  });

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  bool get isSignUp => widget.mode == AuthMode.signUp;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    final password = passwordController.text.trim();

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters long'),
        ),
      );
      return;
    }

    if (isSignUp) {
      if (password != confirmPasswordController.text.trim()) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
        return;
      }

      debugPrint('Register');
    } else {
      widget.onSignIn?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            if (isSignUp) ...[
              AuthTextField(
                label: 'Your full name',
                hint: 'E.g. John Smith',
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
            ],

            AuthTextField(
              label: 'Phone number',
              hint: 'Your phone number',
              controller: phoneController,

              keyboardType: TextInputType.number,

              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number is required';
                }

                if (value.length != 10) {
                  return 'Phone number must be exactly 10 digits';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            AuthTextField(
              label: 'Password',
              hint: 'Enter your password',
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }

                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }

                return null;
              },
            ),

            if (isSignUp) ...[
              const SizedBox(height: 20),

              AuthTextField(
                label: 'Retype your password',
                hint: 'Confirm password',
                controller: confirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }

                  if (value != passwordController.text.trim()) {
                    return 'Passwords do not match';
                  }

                  return null;
                },
              ),
            ],

            if (!isSignUp) ...[
              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResetPasswordScreen(
                          onSendCode: (phone) async {
                            print(phone);
                          },
                        ),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Forgot your password',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  isSignUp ? 'Sign up' : 'Sign in',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isSignUp
                      ? 'Already have an account? '
                      : "Don't have an account? ",
                ),
                GestureDetector(
                  onTap: widget.onAuthSwitch,
                  child: Text(
                    isSignUp ? 'Sign in' : 'Sign up',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
