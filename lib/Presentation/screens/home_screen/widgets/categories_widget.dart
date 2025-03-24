import 'package:blood_bank/Presentation/screens/home_screen/widgets/section_card.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: SectionCard(text: "بحث عن متبرعين", icon: Icons.search)),
          SizedBox(width: GSizes.spaceBetweenItems),
          Expanded(
              child: SectionCard(
                  text: "بحث عن متبرعين", icon: Icons.ac_unit_rounded)),
          SizedBox(width: GSizes.spaceBetweenItems),
          Expanded(
              child: SectionCard(
                  text: "بحث عن متبرعين", icon: Icons.account_circle)),
        ]),
        SizedBox(height: GSizes.spaceBetweenItems),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: SectionCard(text: "بحث عن متبرعين", icon: Icons.search)),
          SizedBox(width: GSizes.spaceBetweenItems),
          Expanded(
              child: SectionCard(
                  text: "بحث عن متبرعين", icon: Icons.ac_unit_rounded)),
          SizedBox(width: GSizes.spaceBetweenItems),
          Expanded(
              child: SectionCard(
                  text: "بحث عن متبرعين", icon: Icons.account_circle)),
        ])
      ]),
    );
  }
}
