import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/forgot_password.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/find_donors_screen.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:blood_bank/utils/validators.dart';
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
            onPressed: () {
              if (formState.currentState!.validate()) {
                context.read<UserAuthBloc>().add(UserAuthLoginEvent(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim()));
              }
            }),
        SizedBox(height: GSizes.spaceBetweenSections * 2),
        BlocListener<UserAuthBloc, UserAuthState>(
          listener: (context, state) {
            if (state is UserAuthErrorState) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                showCustomSnackBar(context, state.error);
              });
            } else if (state is UserAuthSignInSuccessState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showCustomSnackBar(context, "تم تسجيل الدخول بنجاح!");
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => FindDonorsScreen()),
                    (route) => false);
              });
            }
          },
          child: BlocBuilder<UserAuthBloc, UserAuthState>(
              builder: (context, state) {
            if (state is UserAuthLoadingState) {
              return Center(child: customCircularProgressIndicator());
            }
            return Container();
          }),
        ),
      ]),
    );
  }
}
