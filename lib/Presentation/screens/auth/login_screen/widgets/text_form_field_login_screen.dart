import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/forgot_password.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/find_donors_screen.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bloc/user_auth_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFormFieldLoginScreen extends StatelessWidget {
  const TextFormFieldLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Column(children: [
      CustomTextFormField(
          text: GText.enterEmail,
          icon: Icons.email_outlined,
          controller: emailController),
      SizedBox(height: GSizes.spaceBetweenSections),
      CustomTextFormField(
          text: GText.enterPassword,
          icon: Icons.lock_outlined,
          controller: passwordController),
      ForgotPassword(),
      SizedBox(height: GSizes.spaceBetweenSections * 2),
      CustomButton(
          text: GText.txtBtnLoginScreen,
          onPressed: () {
            context.read<UserAuthBloc>().add(UserAuthLoginEvent(
                email: emailController.text.trim(),
                password: passwordController.text.trim()));
          }),
      SizedBox(height: GSizes.spaceBetweenSections * 2),
      BlocBuilder<UserAuthBloc, UserAuthState>(
        builder: (context, state) {
          if (state is UserAuthLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserAuthErrorState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              showCustomSnackBar(context, state.error);
            });
          } else if (state is UserAuthLoginSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showCustomSnackBar(context, "تم تسجيل الدخول بنجاح!");
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => FindDonorsScreen()),
                (route) => false,
              );
            });
          }
          return Container();
        },
      ),
    ]);
  }
}
