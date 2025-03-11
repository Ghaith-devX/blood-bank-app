import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class UserSettingsProfile extends StatelessWidget {
  const UserSettingsProfile({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        color: GColors.warmWhite,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(icon, color: GColors.primaryColor),
              SizedBox(width: GSizes.spaceBetweenItems),
              Text(text, style: GStyle.subTitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}
