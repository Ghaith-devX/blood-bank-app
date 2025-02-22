part of 'user_auth_bloc.dart';

@immutable
abstract class UserAuthState {}

class UserAuthInitial extends UserAuthState {}

class UserAuthLoadingState extends UserAuthState {}

class UserAuthSuccessState extends UserAuthState {
  final User? user;

  UserAuthSuccessState({required this.user});
}

class UserAuthErrorState extends UserAuthState {
  final String error;

  UserAuthErrorState({required this.error});
}
