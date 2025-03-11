part of 'get_user_data_cubit.dart';

@immutable
abstract class GetUserDataState {}

class GetUserDataInitial extends GetUserDataState {}

class GetUserDataLoading extends GetUserDataState {}

class GetUserDataLoaded extends GetUserDataState {
  final UserModel user;

  GetUserDataLoaded({required this.user});
}

class GetUserDataError extends GetUserDataState {
  final String error;

  GetUserDataError({required this.error});
}
