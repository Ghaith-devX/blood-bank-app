part of 'verify_email_cubit.dart';

@immutable
abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class UserEmailInitial extends VerifyEmailState {}

class UserEmailLoading extends VerifyEmailState {}

class UserEmailVerified extends VerifyEmailState {}

class UserEmailNotVerified extends VerifyEmailState {}

class UserEmailVerificationFailed extends VerifyEmailState {
  final String error;
  UserEmailVerificationFailed({required this.error});
}
