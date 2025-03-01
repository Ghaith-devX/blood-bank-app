import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  VerifyEmailCubit() : super(VerifyEmailInitial());

  void checkEmailVerification() async {
    emit(UserEmailLoading());

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.reload();
        if (user.emailVerified) {
          emit(UserEmailVerified());
        } else {
          emit(UserEmailNotVerified());
        }
      } else {
        emit(UserEmailVerificationFailed(error: "لم يتم العثور على المستخدم"));
      }
    } catch (e) {
      emit(UserEmailVerificationFailed(error: "حدث خطأ: ${e.toString()}"));
    }
  }
}
