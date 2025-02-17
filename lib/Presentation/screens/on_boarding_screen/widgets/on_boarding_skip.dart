import 'package:blood_bank/Presentation/screens/auth/login_screen/login_screen.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10,
        left: 10,
        child: TextButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(GColors.primaryColor)),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            },
            child: Text(GText.onBoardingSkip,
                style: TextStyle(
                    fontFamily: GText.myFont,
                    fontSize: 16,
                    color: GColors.white,
                    fontWeight: FontWeight.bold))));
  }
}
