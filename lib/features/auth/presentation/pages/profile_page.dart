import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/models/terms_model.dart';
import 'package:vyaparnet/features/auth/presentation/pages/settings_page.dart';
import 'package:vyaparnet/features/auth/presentation/pages/support_page.dart';
import 'package:vyaparnet/features/auth/presentation/pages/terms_conditions_page.dart';
import 'package:vyaparnet/features/auth/presentation/widgets/dashboard_bottom_nav.dart';
import '../models/profile_model.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_tile.dart';
import 'package:vyaparnet/features/auth/presentation/pages/personal_info_page.dart';
import 'package:vyaparnet/features/auth/presentation/pages/privacy_policy_page.dart';
import 'package:vyaparnet/features/auth/presentation/pages/sign_in_page.dart';

class ProfilePage extends StatelessWidget {
  final ProfileModel profile;

  const ProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 4),

      body: Column(
        children: [
          ProfileHeader(profile: profile),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    ProfileMenuTile(
                      title: 'Personal Info',
                      icon: Icons.person_outline,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PersonalInfoPage(profile: profile),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 12),

                    ProfileMenuTile(
                      title: 'Setting',
                      icon: Icons.settings,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 12),

                    ProfileMenuTile(
                      title: 'Support',
                      icon: Icons.phone_enabled,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SupportPage(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 12),

                    ProfileMenuTile(
                      title: 'Privacy & Policy',
                      icon: Icons.description_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TermsConditionsPage(
                              sections: const [
                                TermsSection(
                                  title: 'Terms of Use',
                                  description:
                                      'Welcome to VyaparNet! We, VyaparNet Inc., are excited to have you as part of our community. In these Terms of Use, we will explain in detail how our mobile application works and what you can expect when using it. Please take the time to carefully read and understand these terms before registering and using our services. By accessing and using VyaparNet, you are agreeing to follow these Terms.',
                                ),

                                TermsSection(
                                  title: 'Privacy Policy',
                                  description:
                                      'By this Privacy Policy (the "Policy"), we, VyaparNet Inc., shall provide you all the detailed information about collecting, using, sharing and otherwise processing your personal data.',
                                ),

                                TermsSection(
                                  title: 'Community Standards',
                                  description:
                                      'At VyaparNet, we are committed to fostering a positive and respectful community for all our users. To ensure a safe and enjoyable experience, we have established the following Community Standards.',
                                ),
                              ],

                              onAccept: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 12),

                    ProfileMenuTile(
                      title: 'Sign Out',
                      icon: Icons.logout,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Sign Out'),
                            content: const Text(
                              'Are you sure you want to sign out?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignInPage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: const Text('Sign Out'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
