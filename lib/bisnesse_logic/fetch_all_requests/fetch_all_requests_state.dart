part of 'fetch_all_requests_bloc.dart';

@immutable
abstract class FetchAllRequestsState {}

class FetchAllRequestsInitial extends FetchAllRequestsState {}

class FetchRequestLoadingState extends FetchAllRequestsState {}

class FetchRequestLoadedState extends FetchAllRequestsState {
  final List<Map<String, dynamic>> data;

  FetchRequestLoadedState({required this.data});
}

class FetchRequestErrorState extends FetchAllRequestsState {
  final String error;

  FetchRequestErrorState({required this.error});
}
