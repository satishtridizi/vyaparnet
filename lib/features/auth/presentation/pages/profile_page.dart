import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/pages/settings_page.dart';
import 'package:vyaparnet/features/auth/presentation/pages/support_page.dart';
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
    ProfileHeader(profile: profile);

    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 4),

      body: Column(
        children: [
          ProfileHeader(profile: profile),

          Expanded(
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

                  ProfileMenuTile(
                    title: 'Support',
                    icon: Icons.support_agent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SupportPage(),
                        ),
                      );
                    },
                  ),

                  ProfileMenuTile(
                    title: 'Privacy & Policy',
                    icon: Icons.description_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyPage(),
                        ),
                      );
                    },
                  ),

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
        ],
      ),
    );
  }
}
