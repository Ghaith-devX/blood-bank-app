import 'package:blood_bank/Presentation/screens/home_screen/widgets/banners.dart';
import 'package:flutter/material.dart';

class MyBanners extends StatelessWidget {
  const MyBanners({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: PageView(
        controller: pageController,
        children: [
          Banners(
              imageUrl:
                  "assets/images/banner_home_screen/donation_campaign_banner1.jpg"),
          Banners(
              imageUrl:
                  "assets/images/banner_home_screen/donation_campaign_banner2.jpg"),
          Banners(
              imageUrl:
                  "assets/images/banner_home_screen/donation_campaign_banner3.jpg")
        ],
      ),
    );
  }
}
