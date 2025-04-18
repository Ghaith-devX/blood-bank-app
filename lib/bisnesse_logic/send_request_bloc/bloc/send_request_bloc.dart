import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_request_event.dart';
part 'send_request_state.dart';

class SendRequestBloc extends Bloc<SendRequestEvent, SendRequestState> {
  final FirebaseRepository _firebaseRepository;

  SendRequestBloc(this._firebaseRepository) : super(SendRequestInitial()) {
    on<AddRequestEvent>((event, emit) async {
      emit(SendRequestLoading());
      try {
        await _firebaseRepository.sendRequest(event.bloodType, event.phoneDonor,
            event.note, event.hospital, event.dEmail);
        emit(SendRequestLoaded());
      } catch (e) {
        emit(SendRequestError(error: e.toString()));
      }
    });
  }
}
