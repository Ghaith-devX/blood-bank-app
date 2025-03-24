import 'package:blood_bank/constants/g_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorBanners extends StatelessWidget {
  const SmoothPageIndicatorBanners({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: const ExpandingDotsEffect(
          activeDotColor: GColors.primaryColor, dotHeight: 6),
    );
  }
}
