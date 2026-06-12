import 'package:flutter/material.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileMenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -2),

      leading: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xffFFF4EC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xffF4B266), size: 22),
      ),

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff43455B),
        ),
      ),

      trailing: const Icon(Icons.chevron_right, color: Color(0xffC9CBD8)),
    );
  }
}
