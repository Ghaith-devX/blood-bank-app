import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
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
                    Text("استعادة حسابك بسهولة", style: GStyle.titleStyle),
                    SizedBox(height: GSizes.spaceBetweenSections * 2),
                    Text(
                        "نسيت كلمة المرور؟ لا مشكلة! أدخل بريدك الإلكتروني أدناه وانقر على الزر لإرسال رابط إعادة التعيين.",
                        style: GStyle.subTitleStyle),
                    SizedBox(height: GSizes.spaceBetweenSections),
                    CustomTextFormField(
                        text: "ادخل بريدك الالكتروني",
                        icon: Icons.email,
                        controller: emailController),
                    SizedBox(height: GSizes.spaceBetweenSections * 2),
                    CustomButton(
                        text: "إرسال رابط إعادة التعيين",
                        onPressed: () {
                          context.read<UserAuthBloc>().add(
                              UserAuthResetPasswordSuccessEvent(
                                  email: emailController.text.trim()));
                        }),
                    BlocListener<UserAuthBloc, UserAuthState>(
                      listener: (context, state) {
                        if (state is UserAuthResetPasswordSuccessState) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: BlocBuilder<UserAuthBloc, UserAuthState>(
                        builder: (context, state) {
                          if (state is UserAuthResetPasswordLoadingState) {
                            return Center(
                                child: customCircularProgressIndicator());
                          } else if (state
                              is UserAuthResetPasswordSuccessState) {
                            showCustomSnackBar(context,
                                "تم أرسال رابط إعادة التعيين الى بريدك الإلكتروني");
                          } else if (state is UserAuthResetPasswordErrorState) {
                            showCustomSnackBar(context, state.error);
                          }
                          return SizedBox();
                        },
                      ),
                    )
                  ]))),
    );
  }
}
