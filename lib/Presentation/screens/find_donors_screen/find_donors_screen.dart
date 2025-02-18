import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class FindDonorsScreen extends StatelessWidget {
  const FindDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.white,
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.all(8),
          color: GColors.whiteGrey,
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios, color: GColors.darkGrey)),
        ),
        centerTitle: true,
        title: Text("البحث عن متبرعين", style: GStyle.titleStyle),
      ),
      body: Padding(
          padding: GSizes.screenPadding,
          child: Column(children: [
            SizedBox(height: GSizes.spaceBetweenItems),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))))),
                SizedBox(width: GSizes.spaceBetweenItems),
                Container(
                    decoration: BoxDecoration(
                        color: GColors.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter, color: GColors.white))),
              ],
            ),
            SizedBox(width: GSizes.spaceBetweenSections * 2),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: GColors.warmWhite,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ])),
    );
  }
}
