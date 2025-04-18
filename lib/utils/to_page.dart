import 'package:blood_bank/Presentation/screens/auth/verify_email/verify_email.dart';
import 'package:blood_bank/Presentation/screens/on_boarding_screen/on_boarding_screen_one.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:blood_bank/navigation.dart';
import 'package:flutter/material.dart';

class ToPage {
  final userState = FirebaseService().currentUser;
  Widget toPage() {
    if (userState == null) {
      return OnBoardingScreenOne();
    } else if (userState!.emailVerified) {
      return NavigationMenu();
    } else if (!userState!.emailVerified) {
      return VerifyEmail();
    }
    return OnBoardingScreenOne();
  }
}
