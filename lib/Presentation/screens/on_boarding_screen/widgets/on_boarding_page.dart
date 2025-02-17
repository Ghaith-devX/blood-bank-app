import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GSizes.screenPadding,
      child: Column(
        children: [
          Image(image: AssetImage(image)),
          SizedBox(height: GSizes.spaceBetweenSections * 2),
          Text(title, textAlign: TextAlign.center, style: GStyle.titleStyle),
          SizedBox(height: GSizes.spaceBetweenSections * 2),
          Text(subTitle,
              textAlign: TextAlign.center, style: GStyle.subTitleStyle),
        ],
      ),
    );
  }
}
