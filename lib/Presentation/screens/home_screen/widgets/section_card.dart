import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.text,
    required this.icon,
    super.key,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            color: GColors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: GColors.primaryColor, size: 50),
              SizedBox(height: GSizes.spaceBetweenItems),
              Text(
                text,
                style: GStyle.unselectedLabelStyle,
              )
            ]),
      ),
    );
  }
}
