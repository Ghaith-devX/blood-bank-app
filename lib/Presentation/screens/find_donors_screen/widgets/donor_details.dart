import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_blood_type.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_contact_buttons.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_location.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_times_dnated.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class DonorDetails extends StatelessWidget {
  const DonorDetails({
    super.key,
    required this.donorName,
    required this.donorBloodType,
    required this.donorLocation,
  });
  final String donorName;
  final String donorBloodType;
  final String donorLocation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(donorName, style: GStyle.titleStyle),
        SizedBox(height: GSizes.spaceBetweenItems),
        DonorLocation(donorLocation: donorLocation),
        SizedBox(height: GSizes.spaceBetweenSections * 2),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DonorBloodType(donorBloodType: donorBloodType),
            SizedBox(width: GSizes.spaceBetweenSections * 3),
            DonorTimesDonated(timesDonated: "6"),
          ],
        ),
        SizedBox(height: GSizes.spaceBetweenSections * 2),
        DonorContactButtons()
      ],
    );
  }
}
