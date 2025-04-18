part of 'fetch_all_requests_bloc.dart';

@immutable
abstract class FetchAllRequestsEvent {}

class FetchRequestEvent extends FetchAllRequestsEvent {
  final String email;

  FetchRequestEvent({required this.email});
}
