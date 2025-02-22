import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/screens/home_screen/home_screen.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/bloc/user_auth_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
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

    return Column(children: [
      CustomTextFormField(text: GText.enterUsername, icon: Icons.person),
      SizedBox(height: GSizes.spaceBetweenItems * 2),
      CustomTextFormField(
          text: GText.enterEmail,
          icon: Icons.email,
          controller: emailController),
      SizedBox(height: GSizes.spaceBetweenItems * 2),
      CustomTextFormField(
          text: GText.enterPassword,
          icon: Icons.lock,
          controller: passwordController),
      SizedBox(height: GSizes.spaceBetweenItems * 2),
      CustomTextFormField(text: GText.enterBloodType, icon: Icons.bloodtype),
      SizedBox(height: GSizes.spaceBetweenItems * 2),
      CustomTextFormField(text: GText.enterLocation, icon: Icons.location_on),
      SizedBox(height: GSizes.spaceBetweenSections * 2),
      CustomButton(
        text: GText.btnCreateAccount,
        onPressed: () {
          BlocProvider.of<UserAuthBloc>(context).add(UserAuthSignUpEvent(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              username: usernameController.text,
              bloodType: bloodTypeController.text.trim(),
              location: locationController.text));
        },
      ),
      BlocBuilder<UserAuthBloc, UserAuthState>(
        builder: (context, state) {
          if (state is UserAuthLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserAuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("خطأ : ${state.error}")),
            );
          } else if (state is UserAuthSuccessState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
          }
          return Container();
        },
      ),
    ]);
  }
}
