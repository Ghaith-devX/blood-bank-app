import 'package:blood_bank/Presentation/screens/find_donors_screen/find_donors_screen.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class YemenBloodBankApp extends StatelessWidget {
  const YemenBloodBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = FirebaseService().currentUser;
    Future.delayed(Duration.zero, () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: GColors.white),
        debugShowCheckedModeBanner: false,
        locale: Locale('ar'),
        supportedLocales: [
          Locale('ar', ''),
          Locale('en', ''),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: FindDonorsScreen()
        // userState != null && userState.emailVerified
        //     ? FindDonorsScreen()
        //     : OnBoardingScreenOne(),
        );
  }
}
