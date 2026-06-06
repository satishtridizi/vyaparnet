import 'package:flutter/material.dart';

class ProfileMenuModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileMenuModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
