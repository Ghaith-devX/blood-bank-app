part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}
class OtpLodingState extends OtpState {}

class OtpSentState extends OtpState {
  final String phoneNumber;

  OtpSentState(this.phoneNumber);
}

class OtpVerifiedState extends OtpState {}

class OtpErrorState extends OtpState {
  final String message;

  OtpErrorState(this.message);
}
