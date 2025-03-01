import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/auth/verify_email/verify_email.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:blood_bank/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFormFieldSignupScreen extends StatelessWidget {
  const TextFormFieldSignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController bloodTypeController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    GlobalKey<FormState> formState = GlobalKey();

    return Form(
      key: formState,
      child: Column(children: [
        CustomTextFormField(
            text: GText.enterUsername,
            icon: Icons.person,
            controller: usernameController,
            validator: validateUsername),
        SizedBox(height: GSizes.spaceBetweenItems * 2),
        CustomTextFormField(
            text: GText.enterEmail,
            icon: Icons.email,
            controller: emailController,
            validator: validateEmail),
        SizedBox(height: GSizes.spaceBetweenItems * 2),
        CustomTextFormField(
            text: GText.enterPassword,
            icon: Icons.lock,
            controller: passwordController,
            validator: validatePassword),
        SizedBox(height: GSizes.spaceBetweenItems * 2),
        CustomTextFormField(
            text: GText.enterBloodType,
            icon: Icons.bloodtype,
            controller: bloodTypeController,
            validator: validateBloodType),
        SizedBox(height: GSizes.spaceBetweenItems * 2),
        CustomTextFormField(
            text: GText.enterLocation,
            icon: Icons.location_on,
            controller: locationController,
            validator: validateAddress),
        SizedBox(height: GSizes.spaceBetweenSections * 2),
        CustomButton(
            text: GText.btnCreateAccount,
            onPressed: () {
              if (formState.currentState!.validate()) {
                context.read<UserAuthBloc>().add(UserAuthSignUpEvent(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    username: usernameController.text.trim(),
                    bloodType: bloodTypeController.text.trim(),
                    location: locationController.text.trim()));
              }
            }),
        SizedBox(height: GSizes.spaceBetweenSections * 2),
        BlocListener<UserAuthBloc, UserAuthState>(
          listener: (context, state) {
            if (state is UserAuthErrorState) {
              showCustomSnackBar(context, state.error);
            } else if (state is UserAuthSignUpSuccessState) {
              showCustomSnackBar(context, "يجب التحقق من بريدك الالكتروني");

              context.read<UserAuthBloc>().add(UserAuthVerifyEmailEvent());
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => VerifyEmail()));
            }
          },
          child: BlocBuilder<UserAuthBloc, UserAuthState>(
            builder: (context, state) {
              if (state is UserAuthLoadingState) {
                return Center(child: customCircularProgressIndicator());
              }
              return Container();
            },
          ),
        ),
      ]),
    );
  }
}
