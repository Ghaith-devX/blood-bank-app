import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_all_requests_event.dart';
part 'fetch_all_requests_state.dart';

class FetchAllRequestsBloc
    extends Bloc<FetchAllRequestsEvent, FetchAllRequestsState> {
  final FirebaseRepository _firebaseRepository;
  FetchAllRequestsBloc(this._firebaseRepository)
      : super(FetchAllRequestsInitial()) {
    on<FetchRequestEvent>((event, emit) async {
      try {
        emit(FetchRequestLoadingState());

        final data = await _firebaseRepository.fetchAllRequests(event.email);
        emit(FetchRequestLoadedState(data: data));
      } catch (e) {
        emit(FetchRequestErrorState(error: e.toString()));
      }
    });
  }
}
