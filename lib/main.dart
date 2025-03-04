import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/verify_email/verify_email_cubit.dart';
import 'package:blood_bank/bisnesse_logic/find_donors/find_donors_bloc.dart';
import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:blood_bank/yemen_blood_bank_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
