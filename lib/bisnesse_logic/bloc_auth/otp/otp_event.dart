part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class SendOtpEvent extends OtpEvent {
  final String phoneNumber;
  SendOtpEvent(this.phoneNumber);
}

class VerifyOtpEvent extends OtpEvent {
  final String phoneNumber;
  final String otp;
  VerifyOtpEvent(this.phoneNumber, this.otp);
}
