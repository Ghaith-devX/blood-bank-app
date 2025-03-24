import 'package:blood_bank/Presentation/screens/on_boarding_screen/on_boarding_screen_one.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:blood_bank/navigation.dart';
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
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedLabelStyle: GStyle.unselectedLabelStyle,
            selectedLabelStyle: GStyle.primaryText),
      ),
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
      home: userState != null && userState.emailVerified
          ? NavigationMenu()
          : OnBoardingScreenOne(),
    );
  }
}
