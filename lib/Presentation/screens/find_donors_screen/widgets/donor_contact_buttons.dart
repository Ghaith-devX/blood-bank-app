import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/call_now_button.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/request_button.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:flutter/material.dart';

class DonorContactButtons extends StatelessWidget {
  const DonorContactButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 60,
          child: RequestButton(),
        ),
        SizedBox(width: GSizes.spaceBetweenSections),
        SizedBox(
          height: 60,
          child: CallNowButton(),
        ),
      ],
    );
  }
}
