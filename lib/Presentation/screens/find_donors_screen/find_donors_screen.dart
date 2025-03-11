import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/appbar_find_donor_screen.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donors_data.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/search_bar_find_donors_screen.dart';
import 'package:blood_bank/bisnesse_logic/find_donors/find_donors_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
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
          child: Column(
            children: [
              SearchBarFindDonorsScreen(),
              SizedBox(height: GSizes.spaceBetweenSections * 2),
              DonorsData(),
            ],
          ),
        ),
      ),
    );
  }
}
