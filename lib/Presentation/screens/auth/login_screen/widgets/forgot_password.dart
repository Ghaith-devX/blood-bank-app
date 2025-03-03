import 'package:blood_bank/Presentation/screens/auth/reset_password/reset_password_screen.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
          },
          child: Text(GText.forgotPassword, style: GStyle.primaryText)),
    );
  }
}
