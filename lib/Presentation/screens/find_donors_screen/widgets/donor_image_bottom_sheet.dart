import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class DonorImageBottomSheet extends StatelessWidget {
  const DonorImageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: GColors.warmWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image(image: AssetImage(GText.personImage1)),
    );
  }
}
