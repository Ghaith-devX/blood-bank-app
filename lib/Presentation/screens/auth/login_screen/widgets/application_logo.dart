import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class ApplicationLogo extends StatelessWidget {
  const ApplicationLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image(
        image: AssetImage(GText.appLogo),
        height: 70,
        width: 70,
      ),
      SizedBox(height: GSizes.spaceBetweenSections * 1.2),
      Text(GText.appName,
          style: TextStyle(
              fontFamily: GText.myFont,
              color: GColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold)),
    ]);
  }
}
