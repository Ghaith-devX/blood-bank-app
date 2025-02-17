import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/auth/verify_email/verify_email.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class TextFormFieldSignupScreen extends StatelessWidget {
  const TextFormFieldSignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextFormField(text: GText.enterUsername, icon: Icons.person),
      SizedBox(height: GSizes.spaceBetweenItems * 2),
      CustomTextFormField(text: GText.enterEmail, icon: Icons.email),
      SizedBox(height: GSizes.spaceBetweenItems * 2),
      CustomTextFormField(text: GText.enterPassword, icon: Icons.lock),
      SizedBox(height: GSizes.spaceBetweenItems * 2),
      CustomTextFormField(text: GText.enterBloodType, icon: Icons.bloodtype),
      SizedBox(height: GSizes.spaceBetweenItems * 2),
      CustomTextFormField(text: GText.enterLocation, icon: Icons.location_on),
      SizedBox(height: GSizes.spaceBetweenSections * 2),
      CustomButton(
          text: GText.btnCreateAccount,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const VerifyEmail()));
          }),
    ]);
  }
}
