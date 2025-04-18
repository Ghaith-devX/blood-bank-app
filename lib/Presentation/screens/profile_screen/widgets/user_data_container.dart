import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class UserDataContainer extends StatelessWidget {
  const UserDataContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: GColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: GStyle.titleProfileScreen),
          SizedBox(height: GSizes.spaceBetweenItems / 2),
          Text(
            subTitle,
            style: GStyle.subTitleStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
