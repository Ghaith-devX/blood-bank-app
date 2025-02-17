import 'package:blood_bank/Presentation/screens/on_boarding_screen/widgets/on_boarding_dot_navigation.dart';
import 'package:blood_bank/Presentation/screens/on_boarding_screen/widgets/on_boarding_page.dart';
import 'package:blood_bank/Presentation/screens/on_boarding_screen/widgets/on_boarding_skip.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class OnBoardingScreenOne extends StatefulWidget {
  const OnBoardingScreenOne({super.key});

  @override
  State<OnBoardingScreenOne> createState() => _OnBoardingScreenOneState();
}

class _OnBoardingScreenOneState extends State<OnBoardingScreenOne> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      body: Stack(children: [
        PageView(controller: pageController, children: [
          const OnBoardingPage(
              image: GText.onBoardingImage1,
              title: GText.onBoardingTitle1,
              subTitle: GText.onBoardingSubTitle1),
          const OnBoardingPage(
              image: GText.onBoardingImage2,
              title: GText.onBoardingTitle2,
              subTitle: GText.onBoardingSubTitle2),
        ]),
        OnBoardingSkip(),
        OnBoardingDotNavigation(
          pageController: pageController,
        )
      ]),
    );
  }
}
