import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
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
          child: SingleChildScrollView(
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
              SizedBox(height: GSizes.spaceBetweenSections * 2),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: GColors.warmWhite,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: GColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(image: AssetImage(GText.personImage1)),
                        ),
                      ),
                      SizedBox(width: GSizes.spaceBetweenItems * 2),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("فاعل خير",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: GText.myFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: GColors.darkGrey)),
                              SizedBox(height: GSizes.spaceBetweenItems * 1.5),
                              Row(
                                children: [
                                  SizedBox(width: GSizes.spaceBetweenItems),
                                  Text("شبوة / عتق / حي الجوازات",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontFamily: GText.myFont,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: GColors.blackishGrey)),
                                ],
                              ),
                            ]),
                      ),
                      SizedBox(width: GSizes.spaceBetweenItems * 2),
                      Icon(Icons.bloodtype)
                    ],
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
