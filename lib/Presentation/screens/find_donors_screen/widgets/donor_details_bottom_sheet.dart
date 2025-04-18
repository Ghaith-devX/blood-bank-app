import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_details.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/widgets/donor_image_bottom_sheet.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:flutter/material.dart';

Future<dynamic> donorDetailsBottomSheet(
    BuildContext context, List<UserModel> data, int i) {
  final donor = data[i];
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (bottomSheetContext) {
      return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(bottomSheetContext).size.height * 0.8,
          decoration: BoxDecoration(
            color: GColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: DonorDetails(
                        donor: donor,
                        donorName: data[i].username,
                        donorBloodType: data[i].bloodType,
                        donorLocation: data[i].location,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: Center(child: DonorImageBottomSheet()),
              ),
            ],
          ),
        ),
      );
    },
  );
}
