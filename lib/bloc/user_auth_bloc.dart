import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:blood_bank/utils/validators_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final FirebaseRepository _firebaseRepository;
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

        if (user != null) {
          emit(UserAuthSuccessState(user: user));
        } else {
          emit(UserAuthErrorState(
              error: "فشل تسجيل الحساب. يرجى المحاولة لاحقًا."));
        }
      } on FirebaseAuthException catch (e) {
        emit(UserAuthErrorState(error: getFirebaseAuthErrorMessage(e)));
        print("كود الخطأ: ${e.code}");
        print("كود الخطأ: ${e.message}");
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
        if (user != null) {
          emit(UserAuthLoginSuccessState(user: user));
        } else {
          emit(UserAuthErrorState(
              error: "فشل تسجيل الحساب. يرجى المحاولة لاحقًا."));
        }
      } on FirebaseAuthException catch (e) {
        emit(UserAuthErrorState(error: getFirebaseAuthErrorMessage(e)));
        print("كود الخطأ: ${e.code}");
        print("كود الخطأ: ${e.message}");
      }
    });

    // sign out
    on<UserAuthSignOutEvent>((event, emit) async {
      emit(UserAuthLoadingState());

      try {
        await _firebaseRepository.signOut();
        emit(UserAuthSignOutSuccessState());
      } catch (e) {
        emit(UserAuthErrorState(error: e.toString()));
      }
    });
  }
}
