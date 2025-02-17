import 'package:blood_bank/constants/g_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).padding.bottom + 150,
      child: Center(
        child: SmoothPageIndicator(
          controller: pageController,
          count: 2,
          effect: const ExpandingDotsEffect(
              activeDotColor: GColors.primaryColor, dotHeight: 6),
        ),
      ),
    );
  }
}
