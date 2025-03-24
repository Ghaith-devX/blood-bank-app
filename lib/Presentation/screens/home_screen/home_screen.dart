import 'package:blood_bank/Presentation/screens/home_screen/widgets/app_banners.dart';
import 'package:blood_bank/Presentation/screens/home_screen/widgets/appbar_home_screen.dart';
import 'package:blood_bank/Presentation/screens/home_screen/widgets/categories_widget.dart';
import 'package:blood_bank/Presentation/widgets/blood_type_widget.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';

import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHomeScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: GSizes.screenPadding,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppBanners(),
            SizedBox(height: GSizes.spaceBetweenSections * 2),
            CategoriesWidget(),
            SizedBox(height: GSizes.spaceBetweenSections * 2),
            Text("طلبات التبرع", style: GStyle.titleStyle),
            SizedBox(height: GSizes.spaceBetweenSections),
            Container(
              decoration: BoxDecoration(color: GColors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(3, 0),
                    blurRadius: 2,
                    color: Colors.black.withValues(alpha: 0.2))
              ]),
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: GSizes.spaceBetweenItems),
                        Text("فاعل خير جديد", style: GStyle.titleStyle),
                        SizedBox(height: GSizes.spaceBetweenItems),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: GColors.primaryColor),
                            Expanded(
                              child: Text(" شبوة عتق حي لجوازات",
                                  style: GStyle.subTitleStyle),
                            ),
                          ],
                        ),
                        SizedBox(height: GSizes.spaceBetweenItems * 2),
                        Text("منذ 5 دقائق", style: GStyle.unselectedLabelStyle)
                      ]),
                ),
                Column(children: [
                  BloodTypeWidget(donorBloodType: "O+"),
                  SizedBox(height: GSizes.spaceBetweenItems * 2),
                  SizedBox(
                      width: 80,
                      height: 40,
                      child: CustomButton(text: "تبرع", onPressed: () {}))
                ])
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
