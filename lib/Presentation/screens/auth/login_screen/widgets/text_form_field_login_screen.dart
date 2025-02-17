import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/forgot_password.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/find_donors_screen.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class TextFormFieldLoginScreen extends StatelessWidget {
  const TextFormFieldLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextFormField(text: GText.enterEmail, icon: Icons.email_outlined),
      SizedBox(height: GSizes.spaceBetweenSections),
      CustomTextFormField(text: GText.enterPassword, icon: Icons.lock_outlined),
      ForgotPassword(),
      SizedBox(height: GSizes.spaceBetweenSections * 2),
      CustomButton(
          text: GText.txtBtnLoginScreen,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const FindDonorsScreen()),
                (route) => false);
          }),
    ]);
  }
}
