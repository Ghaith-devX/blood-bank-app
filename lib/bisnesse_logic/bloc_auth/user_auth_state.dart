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

class UserAuthVerifyEmailState extends UserAuthState {
  final String email;
  UserAuthVerifyEmailState({required this.email});
}

class UserAuthIsVerifedState extends UserAuthState {
  final bool isVerifed;

  UserAuthIsVerifedState({required this.isVerifed});
}

class UserAuthLoadingVerifyEmail extends UserAuthState {}
