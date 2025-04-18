part of 'send_request_bloc.dart';

@immutable
abstract class SendRequestEvent {}

class AddRequestEvent extends SendRequestEvent {
  final String bloodType;
  final String hospital;
  final String phoneDonor;
  final String note;
  final String dEmail;
  AddRequestEvent({
    required this.dEmail,
    required this.bloodType,
    required this.hospital,
    required this.phoneDonor,
    required this.note,
  });
}
