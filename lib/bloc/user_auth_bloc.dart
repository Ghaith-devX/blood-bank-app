import 'package:blood_bank/data/repositories/user_repository.dart';
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
        }
      } catch (e) {
        emit(UserAuthErrorState(error: e.toString()));
      }
    });
  }
}
