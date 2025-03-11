import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class UserImageProfile extends StatelessWidget {
  const UserImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: GColors.warmWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image(image: AssetImage(GText.personImage3)));
  }
}
