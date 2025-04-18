part of 'send_request_bloc.dart';

@immutable
abstract class SendRequestState {}

class SendRequestInitial extends SendRequestState {}

class SendRequestLoading extends SendRequestState {}

class SendRequestLoaded extends SendRequestState {}

class SendRequestError extends SendRequestState {
  final String error;
  SendRequestError({required this.error});
}
