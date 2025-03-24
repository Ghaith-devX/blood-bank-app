import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class BloodTypeWidget extends StatelessWidget {
  const BloodTypeWidget({
    super.key,
    required this.donorBloodType,
  });

  final String donorBloodType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Image(image: AssetImage(GText.bloodImage), height: 70, width: 70),
          Positioned(
            right: 25,
            top: 28,
            child: Text(donorBloodType,
                style: TextStyle(
                    color: GColors.white,
                    fontSize: 18,
                    fontFamily: GText.myFont,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
