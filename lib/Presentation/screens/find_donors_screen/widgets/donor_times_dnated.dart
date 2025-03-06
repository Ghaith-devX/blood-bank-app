import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class DonorTimesDonated extends StatelessWidget {
  const DonorTimesDonated({
    super.key,
    required this.timesDonated,
  });
  final String timesDonated;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.done_outline_sharp, size: 35, color: GColors.primaryColor),
        SizedBox(height: GSizes.spaceBetweenItems * 2),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: timesDonated,
              style: TextStyle(fontSize: 15, color: GColors.primaryColor)),
          TextSpan(text: GText.timesDonated, style: GStyle.subTitleStyle),
        ]))
      ],
    );
  }
}
