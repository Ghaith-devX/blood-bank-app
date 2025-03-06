import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class DonorBloodType extends StatelessWidget {
  const DonorBloodType({
    super.key,
    required this.donorBloodType,
  });

  final String donorBloodType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.bloodtype, size: 35, color: GColors.primaryColor),
        SizedBox(height: GSizes.spaceBetweenItems * 2),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: donorBloodType,
              style: TextStyle(fontSize: 15, color: GColors.primaryColor)),
          TextSpan(text: GText.bloodType, style: GStyle.subTitleStyle),
        ]))
      ],
    );
  }
}
