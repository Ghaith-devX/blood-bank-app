import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/appbar_find_donor_screen.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/card_donors.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/search_bar_find_donors_screen.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/bisnesse_logic/find_donors/find_donors_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindDonorsScreen extends StatelessWidget {
  const FindDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FindDonorsBloc>().add(GetDataEvent());
    return Scaffold(
      appBar: AppBarFindDonorScreen(),
      body: SingleChildScrollView(
        child: Padding(
            padding: GSizes.screenPadding,
            child: Column(children: [
              SearchBarFindDonorsScreen(),
              SizedBox(height: GSizes.spaceBetweenSections * 2),
              BlocBuilder<FindDonorsBloc, FindDonorsState>(
                builder: (context, state) {
                  if (state is GetDataLoadedState) {
                    List<UserModel> data = state.myData;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            CardDonors(
                                donorName: data[i].username,
                                donorLocation: data[i].location,
                                donorBloodType: data[i].bloodType),
                            SizedBox(height: GSizes.spaceBetweenItems),
                          ],
                        );
                      },
                    );
                  } else if (state is GetDataLoadingState) {
                    return Center(child: customCircularProgressIndicator());
                  } else {
                    return Container();
                  }
                },
              ),
            ])),
      ),
    );
  }
}
