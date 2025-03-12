// import 'package:blood_bank/data/services/firebase_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:blood_bank/model/user_model.dart';

// part 'find_donors_event.dart';
// part 'find_donors_state.dart';

// class FindDonorsBloc extends Bloc<FindDonorsEvent, FindDonorsState> {
//   final FirebaseService _firebaseService;
//   FindDonorsBloc(this._firebaseService) : super(FindDonorsInitial()) {
//     on<GetDataEvent>((event, emit) async {
//       emit(GetDataLoadingState());
//       await Future.delayed(const Duration(seconds: 1));
//       try {
//         final data = await _firebaseService.get();
//         emit(GetDataLoadedState(data));
//       } catch (e) {
//         emit(GetDataErrorState(e.toString()));
//       }
//     });
//   }
// }
