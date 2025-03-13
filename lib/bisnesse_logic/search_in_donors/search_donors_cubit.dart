import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_donors_state.dart';

class SearchDonorsCubit extends Cubit<SearchDonorsState> {
  final FirebaseService firebaseService;
  List<UserModel> donors = [];
  List<UserModel> searchDonors = [];
  SearchDonorsCubit(this.firebaseService) : super(SearchDonorsInitial());
  Future serarchDonors(String search) async {
    emit(SearchDonorsLoading());
    try {
      donors = await firebaseService.get();

      if (search.isEmpty) {
        emit(SearchDonorsLoaded(donorsData: donors));
        return;
      }

      searchDonors = donors.where((donor) {
        return donor.bloodType.toLowerCase().contains(search.toLowerCase()) ||
            donor.location.toLowerCase().contains(search.toLowerCase());
      }).toList();

      emit(SearchDonorsLoaded(donorsData: searchDonors));
    } catch (e) {
      emit(SearchDonorsError(message: e.toString()));
    }
  }
}
