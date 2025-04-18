import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_contact_buttons.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_location.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:flutter/material.dart';

class DonorDetails extends StatelessWidget {
  const DonorDetails({
    super.key,
    required this.donor,
    required this.donorName,
    required this.donorBloodType,
    required this.donorLocation,
  });
  final String donorName;
  final String donorBloodType;
  final String donorLocation;
  final UserModel donor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(donorName, style: GStyle.titleStyle),
        SizedBox(height: GSizes.spaceBetweenItems * 2),
        DonorLocation(donorLocation: donorLocation),
        SizedBox(height: GSizes.spaceBetweenSections * 2),
        DonorContactButtons(
          donor: donor,
          donorBloodType: donorBloodType,
          timesDonated: "6 ",
        )
      ],
    );
  }
}
