import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class DonorLocation extends StatelessWidget {
  const DonorLocation({
    super.key,
    required this.donorLocation,
  });

  final String donorLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, color: GColors.primaryColor),
        SizedBox(width: GSizes.spaceBetweenItems - 5),
        Text(donorLocation, style: GStyle.subTitleStyle),
      ],
    );
  }
}
