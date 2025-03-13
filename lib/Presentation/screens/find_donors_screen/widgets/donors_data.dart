import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/card_donors.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_details_bottom_sheet.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/bisnesse_logic/search_in_donors/search_donors_cubit.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonorsData extends StatelessWidget {
  const DonorsData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchDonorsCubit, SearchDonorsState>(
      builder: (context, state) {
        if (state is SearchDonorsLoaded) {
          List<UserModel> data = state.donorsData;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      donorDetailsBottomSheet(context, data, i);
                    },
                    child: CardDonors(
                        donorName: data[i].username,
                        donorLocation: data[i].location,
                        donorBloodType: data[i].bloodType),
                  ),
                  SizedBox(height: GSizes.spaceBetweenItems),
                ],
              );
            },
          );
        } else if (state is SearchDonorsLoading) {
          return Center(child: customCircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}
