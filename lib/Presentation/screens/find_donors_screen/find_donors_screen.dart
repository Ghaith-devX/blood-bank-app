import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/appbar_find_donor_screen.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/card_donors.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/search_bar_find_donors_screen.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:flutter/material.dart';

class FindDonorsScreen extends StatelessWidget {
  const FindDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFindDonorScreen(),
      body: SingleChildScrollView(
        child: Padding(
            padding: GSizes.screenPadding,
            child: Column(children: [
              SearchBarFindDonorsScreen(),
              SizedBox(height: GSizes.spaceBetweenSections * 2),
              CardDonors(),
              SizedBox(height: GSizes.spaceBetweenItems),
              CardDonors(),
              SizedBox(height: GSizes.spaceBetweenItems),
              CardDonors(),
              SizedBox(height: GSizes.spaceBetweenItems),
              CardDonors(),
              SizedBox(height: GSizes.spaceBetweenItems),
              CardDonors(),
              SizedBox(height: GSizes.spaceBetweenItems),
              CardDonors(),
              SizedBox(height: GSizes.spaceBetweenItems),
              CardDonors(),
              SizedBox(height: GSizes.spaceBetweenItems),
              CardDonors()
            ])),
      ),
    );
  }
}
