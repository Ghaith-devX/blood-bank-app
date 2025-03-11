import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  final FirebaseService firebaseService;
  GetUserDataCubit({required this.firebaseService})
      : super(GetUserDataInitial());

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      UserModel user = await firebaseService.getUserData();
      emit(GetUserDataLoaded(user: user));
    } on FirebaseException catch (e) {
      emit(GetUserDataError(error: "خطأ : ${e.message}"));
    } catch (e) {
      emit(GetUserDataError(error: "ظهر خطأ غير معروف : $e"));
    }
  }
}
