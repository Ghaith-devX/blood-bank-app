part of 'user_auth_bloc.dart';

@immutable
abstract class UserAuthEvent {}

class UserAuthSignUpEvent extends UserAuthEvent {
  final String email;
  final String password;
  final String username;
  final String bloodType;
  final String location;
  UserAuthSignUpEvent(
      {required this.email,
      required this.password,
      required this.username,
      required this.bloodType,
      required this.location});
}
