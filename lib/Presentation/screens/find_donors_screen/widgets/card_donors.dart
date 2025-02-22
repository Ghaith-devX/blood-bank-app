import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/card_image_donors.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class CardDonors extends StatelessWidget {
  const CardDonors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: GColors.warmWhite, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CardImageDonor(),
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
                    SizedBox(height: GSizes.spaceBetweenItems),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Flexible(
                          child: Text("شبوة/ عتق/ حي الجوازات ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: GText.myFont,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: GColors.blackishGrey)),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(width: GSizes.spaceBetweenItems),
            SizedBox(
              child: Stack(
                children: [
                  Image(
                      image: AssetImage("assets/images/blood.png"),
                      height: 70,
                      width: 70),
                  Positioned(
                    right: 20,
                    top: 28,
                    child: Text("AB+",
                        style: TextStyle(
                            color: GColors.white,
                            fontSize: 18,
                            fontFamily: GText.myFont,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
