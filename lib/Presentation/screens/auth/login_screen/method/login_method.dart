import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void loginMethod(GlobalKey<FormState> formState, BuildContext context,
    String email, String password) {
  if (formState.currentState!.validate()) {
    context.read<UserAuthBloc>().add(
        UserAuthLoginEvent(email: email.trim(), password: password.trim()));
  }
}
