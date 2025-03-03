import 'package:blood_bank/Presentation/screens/find_donors_screen/find_donors_screen.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/verify_email/verify_email_cubit.dart';
import 'package:blood_bank/bisnesse_logic/find_donors/find_donors_bloc.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Presentation/screens/on_boarding_screen/on_boarding_screen_one.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                UserAuthBloc(FirebaseRepository(FirebaseService()))),
        BlocProvider(create: (context) => VerifyEmailCubit()),
        BlocProvider(create: (context) => FindDonorsBloc(FirebaseService())),
      ],
      child: YemenBloodBankApp(),
    ),
  );
}

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
      home: userState != null && userState.emailVerified
          ? FindDonorsScreen()
          : OnBoardingScreenOne(),
    );
  }
}
