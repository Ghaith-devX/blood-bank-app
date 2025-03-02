part of 'user_auth_bloc.dart';

@immutable
abstract class UserAuthState {}

class UserAuthInitial extends UserAuthState {}

class UserAuthLoadingState extends UserAuthState {}

class UserAuthSignUpSuccessState extends UserAuthState {
  final User? user;

  UserAuthSignUpSuccessState({required this.user});
}

class UserAuthSignInSuccessState extends UserAuthState {
  final User? user;

  UserAuthSignInSuccessState({required this.user});
}

class UserAuthErrorState extends UserAuthState {
  final String error;

  UserAuthErrorState({required this.error});
}

class UserAuthSignOutSuccessState extends UserAuthState {}

class UserAuthIsVerifedState extends UserAuthState {
  final bool isVerifed;

  UserAuthIsVerifedState({required this.isVerifed});
}

class UserAuthLoadingVerifyEmail extends UserAuthState {}

class UserAuthVerifyEmailLoadingState extends UserAuthState {}

class UserAuthVerifyEmailSuccessState extends UserAuthState {}

class UserAuthVerifyEmailErrorState extends UserAuthState {
  final String error;

  UserAuthVerifyEmailErrorState({required this.error});
}

class UserAuthResetPasswordLoadingState extends UserAuthState {}

class UserAuthResetPasswordSuccessState extends UserAuthState {}

class UserAuthResetPasswordErrorState extends UserAuthState {
  final String error;

  UserAuthResetPasswordErrorState({required this.error});
}
