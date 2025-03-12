part of 'search_donors_cubit.dart';

@immutable
abstract class SearchDonorsState {}

class SearchDonorsInitial extends SearchDonorsState {}

class SearchDonorsLoading extends SearchDonorsState {}

class SearchDonorsLoaded extends SearchDonorsState {
  final List<UserModel> donorsData;

  SearchDonorsLoaded({required this.donorsData});
}

class SearchDonorsError extends SearchDonorsState {
  final String message;

  SearchDonorsError({required this.message});
}
