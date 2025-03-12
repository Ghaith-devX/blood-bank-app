import 'package:blood_bank/Presentation/screens/auth/login_screen/method/login_method.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/forgot_password.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/login_handler.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:blood_bank/utils/validators.dart';
import 'package:flutter/material.dart';

class TextFormFieldLoginScreen extends StatelessWidget {
  const TextFormFieldLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formState = GlobalKey();
    return Form(
      key: formState,
      child: Column(children: [
        CustomTextFormField(
            text: GText.enterEmail,
            icon: Icons.email_outlined,
            controller: emailController,
            validator: validateEmail),
        SizedBox(height: GSizes.spaceBetweenSections),
        CustomTextFormField(
            text: GText.enterPassword,
            icon: Icons.lock_outlined,
            controller: passwordController),
        ForgotPassword(),
        SizedBox(height: GSizes.spaceBetweenSections * 2),
        CustomButton(
            text: GText.txtBtnLoginScreen,
            onPressed: () => loginMethod(formState, context,
                emailController.text, passwordController.text)),
        SizedBox(height: GSizes.spaceBetweenSections * 2),
        LoginHandler(),
      ]),
    );
  }
}
