import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:blood_bank/utils/validators_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final FirebaseRepository _firebaseRepository;
  final User? user = FirebaseAuth.instance.currentUser;

  UserAuthBloc(this._firebaseRepository) : super(UserAuthInitial()) {
    on<UserAuthSignUpEvent>((event, emit) async {
      emit(UserAuthLoadingState());

      try {
        var user = await _firebaseRepository.signUp(
          event.email,
          event.password,
          event.username,
          event.bloodType,
          event.location,
        );

        emit(UserAuthSignUpSuccessState(user: user));
      } on FirebaseAuthException catch (e) {
        emit(UserAuthErrorState(error: getFirebaseAuthErrorMessage(e)));
      } catch (e) {
        emit(UserAuthErrorState(error: "حدث خطأ غير متوقع: ${e.toString()}"));
      }
    });

    // login
    on<UserAuthLoginEvent>((event, emit) async {
      emit(UserAuthLoadingState());
      try {
        var user =
            await _firebaseRepository.signIn(event.email, event.password);

        emit(UserAuthSignInSuccessState(user: user));
      } on FirebaseAuthException catch (e) {
        emit(UserAuthErrorState(error: getFirebaseAuthErrorMessage(e)));
      } catch (e) {
        emit(UserAuthErrorState(error: "حدث خطأ غير متوقع: ${e.toString()}"));
      }
    });

    // sign out
    on<UserAuthSignOutEvent>((event, emit) async {
      emit(UserAuthLoadingState());

      try {
        await _firebaseRepository.signOut();
        emit(UserAuthSignOutSuccessState());
      } on FirebaseAuthException catch (e) {
        emit(UserAuthErrorState(error: e.toString()));
      } catch (e) {
        emit(UserAuthErrorState(error: e.toString()));
      }
    });

    on<UserAuthVerifyEmailEvent>((event, emit) async {
      emit(UserAuthVerifyEmailLoadingState());
      try {
        if (FirebaseAuth.instance.currentUser != null) {
          await _firebaseRepository.verifyEmail();
          emit(UserAuthVerifyEmailSuccessState());
        } else {
          emit(UserAuthVerifyEmailErrorState(error: "المستخدم غير مسجل دخول"));
        }
      } on FirebaseAuthException catch (e) {
        emit(UserAuthVerifyEmailErrorState(error: e.code));
      } catch (e) {
        emit(UserAuthVerifyEmailErrorState(error: e.toString()));
      }
    });

    on<UserAuthResetPasswordEvent>((event, emit) async {
      emit(UserAuthResetPasswordLoadingState());

      try {
        await _firebaseRepository.resetPassword(event.email);
        emit(UserAuthResetPasswordSuccessState());
      } on FirebaseAuthException catch (e) {
        emit(UserAuthResetPasswordErrorState(
            error: getFirebaseAuthErrorMessage(e)));
      } catch (e) {
        emit(UserAuthResetPasswordErrorState(
            error: 'الرجاء إدخال بريد إلكتروني'));
      }
    });
  }
}
