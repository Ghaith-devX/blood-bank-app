import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class WelcomeTextSignupScreen extends StatelessWidget {
  const WelcomeTextSignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(GText.titleSignupScreen, style: GStyle.titleStyle),
        Text(GText.subTitleSignupScreen, style: GStyle.subTitleStyle),
      ]),
    );
  }
}
