import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/auth/verification_success_page/verification_success_page.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: GSizes.screenPadding,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomTextFormField(text: GText.enterEmail, icon: Icons.email),
            SizedBox(height: GSizes.spaceBetweenSections),
            Text(GText.textVerify,
                style: GStyle.subTitleStyle, textAlign: TextAlign.center),
            SizedBox(height: GSizes.spaceBetweenSections),
            CustomButton(
                text: GText.send,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VerificationSuccessPage()));
                })
          ])),
    );
  }
}
