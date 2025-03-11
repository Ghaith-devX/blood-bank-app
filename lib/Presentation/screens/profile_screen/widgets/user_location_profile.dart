import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class UserLocationProfile extends StatelessWidget {
  const UserLocationProfile({
    required this.location,
    super.key,
  });
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_on, color: GColors.primaryColor),
        Text(location, style: GStyle.subTitleStyle),
      ],
    );
  }
}
