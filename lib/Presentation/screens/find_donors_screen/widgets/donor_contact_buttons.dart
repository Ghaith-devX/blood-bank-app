import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/call_now_button.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_blood_type.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_times_dnated.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/request_button.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:flutter/material.dart';

class DonorContactButtons extends StatelessWidget {
  const DonorContactButtons({
    super.key,
    required this.donor,
    required this.donorBloodType,
    required this.timesDonated,
  });
  final String donorBloodType;
  final String timesDonated;
  final UserModel donor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            DonorBloodType(donorBloodType: donorBloodType),
            SizedBox(height: GSizes.spaceBetweenSections * 2),
            SizedBox(
              height: 60,
              child: RequestButton(donor: donor),
            ),
          ],
        ),
        SizedBox(width: GSizes.spaceBetweenSections),
        Column(
          children: [
            DonorTimesDonated(timesDonated: timesDonated),
            SizedBox(height: GSizes.spaceBetweenSections * 2),
            SizedBox(
              height: 60,
              child: CallNowButton(),
            ),
          ],
        ),
      ],
    );
  }
}
