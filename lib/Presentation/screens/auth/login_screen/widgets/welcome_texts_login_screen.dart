import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class WelcomeTextsLoginScreen extends StatelessWidget {
  const WelcomeTextsLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(GText.titleLoginScreen, style: GStyle.titleStyle),
        SizedBox(height: GSizes.spaceBetweenItems),
        Text(GText.subTitleLoginScreeen, style: GStyle.subTitleStyle)
      ]),
    );
  }
}
