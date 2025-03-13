import 'package:blood_bank/Presentation/screens/auth/verification_success_page/verification_success_page.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/verify_email/verify_email_cubit.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseRepository firebaseRepository =
        FirebaseRepository(FirebaseService());
    return Scaffold(
      body: Padding(
          padding: GSizes.screenPadding,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(firebaseRepository.userEmail, style: GStyle.titleStyle),
            SizedBox(height: GSizes.spaceBetweenItems),
            Text(GText.textVerify,
                style: GStyle.subTitleStyle, textAlign: TextAlign.center),
            SizedBox(height: GSizes.spaceBetweenSections),
            CustomButton(
                text: GText.send,
                onPressed: () {
                  context.read<UserAuthBloc>().add(UserAuthVerifyEmailEvent());
                }),
            SizedBox(height: GSizes.spaceBetweenSections),
            BlocListener<UserAuthBloc, UserAuthState>(
              listener: (context, state) {
                if (state is UserAuthVerifyEmailSuccessState) {
                  showCustomSnackBar(context,
                      "تم إرسال رسالة التحقق إلى بريدك الإلكتروني. يرجى التحقق من بريدك واتباع التعليمات لتأكيد حسابك.");
                } else if (state is UserAuthVerifyEmailErrorState) {
                  showCustomSnackBar(context, state.error);
                }
              },
              child: BlocBuilder<UserAuthBloc, UserAuthState>(
                builder: (context, state) {
                  if (state is UserAuthVerifyEmailLoadingState) {
                    return Center(child: customCircularProgressIndicator());
                  }
                  return SizedBox();
                },
              ),
            ),
            SizedBox(height: GSizes.spaceBetweenSections),
            CustomButton(
                text: "تحقق",
                onPressed: () {
                  context.read<VerifyEmailCubit>().checkEmailVerification();
                }),
            SizedBox(height: GSizes.spaceBetweenSections),
            BlocListener<VerifyEmailCubit, VerifyEmailState>(
              listener: (context, state) {
                if (state is UserEmailVerified) {
                  firebaseRepository.updateEmailVerificationStatus();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VerificationSuccessPage()));
                } else if (state is UserEmailVerificationFailed) {
                  showCustomSnackBar(context, state.error);
                }
              },
              child: BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
                builder: (context, state) {
                  if (state is UserEmailLoading) {
                    return Center(child: customCircularProgressIndicator());
                  } else if (state is UserEmailVerified) {
                    return Center(
                        child: Text("تم التحقق من بريدك الإلكتروني بنجاح",
                            style: GStyle.subTitleStyle));
                  } else if (state is UserEmailNotVerified) {
                    return Center(
                        child: Text("لم يتم التحقق من البريد الإلكتروني",
                            style: GStyle.subTitleStyle));
                  }
                  return SizedBox();
                },
              ),
            )
          ])),
    );
  }
}
