import 'package:blood_bank/Presentation/screens/auth/signup_screen/widgets/rich_text_signup_screen.dart';
import 'package:blood_bank/Presentation/screens/auth/signup_screen/widgets/text_form_field_signup_.dart';
import 'package:blood_bank/Presentation/screens/auth/signup_screen/widgets/welcome_text_signup_screen.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: GSizes.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: GSizes.spaceBetweenSections * 2),
              WelcomeTextSignupScreen(),
              SizedBox(height: GSizes.spaceBetweenSections * 2),
              TextFormFieldSignupScreen(),
              SizedBox(height: GSizes.spaceBetweenSections * 2),
              RichTextSignupScreen(),
              SizedBox(height: GSizes.spaceBetweenSections * 2),
            ],
          ),
        ),
      )),
    );
  }
}
