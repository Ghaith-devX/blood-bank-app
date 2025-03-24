import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/card_image_donors.dart';
import 'package:blood_bank/Presentation/widgets/blood_type_widget.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class CardDonors extends StatelessWidget {
  const CardDonors({
    super.key,
    required this.donorName,
    required this.donorLocation,
    required this.donorBloodType,
  });
  final String donorName;
  final String donorLocation;
  final String donorBloodType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: GColors.white, borderRadius: BorderRadius.circular(10)),
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
                    Text(donorName,
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
                        Icon(Icons.location_on, color: GColors.primaryColor),
                        Flexible(
                          child: Text(donorLocation,
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
            BloodTypeWidget(donorBloodType: donorBloodType),
          ],
        ),
      ),
    );
  }
}
