import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/auth/reset_password/widgets/reset_password_handler.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:blood_bank/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: GSizes.screenPadding,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(GText.titleResetPasswordScreen,
                        style: GStyle.titleStyle),
                    SizedBox(height: GSizes.spaceBetweenSections * 2),
                    Text(GText.subTitleResetPasswordScreen,
                        style: GStyle.subTitleStyle),
                    SizedBox(height: GSizes.spaceBetweenSections),
                    CustomTextFormField(
                        text: GText.enterEmail,
                        icon: Icons.email,
                        controller: emailController,
                        validator: validateEmail),
                    SizedBox(height: GSizes.spaceBetweenSections * 2),
                    CustomButton(
                        text: GText.sendUrlRestPassword,
                        onPressed: () {
                          context.read<UserAuthBloc>().add(
                              UserAuthResetPasswordEvent(
                                  email: emailController.text.trim()));
                        }),
                    SizedBox(height: GSizes.spaceBetweenSections * 2),
                    BlocListener<UserAuthBloc, UserAuthState>(
                      listener: (context, state) {
                        if (state is UserAuthResetPasswordSuccessState) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: ResetPasswordHandler(),
                    )
                  ]))),
    );
  }
}
