import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class CardImageDonor extends StatelessWidget {
  const CardImageDonor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: GColors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(image: AssetImage(GText.personImage1)),
      ),
    );
  }
}
