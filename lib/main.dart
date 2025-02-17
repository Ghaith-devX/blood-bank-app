import 'package:blood_bank/constants/g_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Presentation/screens/on_boarding_screen/on_boarding_screen_one.dart';

void main() {
  runApp(YemenBloodBankApp());
}

class YemenBloodBankApp extends StatelessWidget {
  const YemenBloodBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: GColors.white),
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: OnBoardingScreenOne(),
    );
  }
}
