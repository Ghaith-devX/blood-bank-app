import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/rich_text_login_screen.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/text_form_field_login_screen.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/welcome_texts_login_screen.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                SizedBox(height: GSizes.spaceBetweenSections * 4),
                WelcomeTextsLoginScreen(),
                SizedBox(height: GSizes.spaceBetweenSections * 2),
                TextFormFieldLoginScreen(),
                SizedBox(height: GSizes.spaceBetweenSections * 2),
                RichTextLoginScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
