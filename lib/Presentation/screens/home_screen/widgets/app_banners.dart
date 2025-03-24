import 'package:blood_bank/Presentation/screens/home_screen/widgets/my_banners.dart';
import 'package:blood_bank/Presentation/screens/home_screen/widgets/smooth_banners.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:flutter/material.dart';

class AppBanners extends StatelessWidget {
  const AppBanners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Column(children: [
      MyBanners(pageController: pageController),
      SizedBox(height: GSizes.spaceBetweenSections),
      SmoothPageIndicatorBanners(pageController: pageController),
    ]);
  }
}
