import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_details.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_image_bottom_sheet.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:flutter/material.dart';

Future<dynamic> donorDetailsBottomSheet(
    BuildContext context, List<UserModel> data, int i) {
  return showModalBottomSheet(
    backgroundColor: GColors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(top: -70, child: DonorImageBottomSheet()),
                  Positioned(
                    top: 90,
                    child: DonorDetails(
                        donorName: data[i].username,
                        donorBloodType: data[i].bloodType,
                        donorLocation: data[i].location),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
