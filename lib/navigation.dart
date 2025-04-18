import 'package:blood_bank/Presentation/screens/auth/verify_email/verify_email.dart';
import 'package:blood_bank/Presentation/screens/find_donors_screen/find_donors_screen.dart';
import 'package:blood_bank/Presentation/screens/home_screen/home_screen.dart';
import 'package:blood_bank/Presentation/screens/profile_screen/profile_screen.dart';
import 'package:blood_bank/bisnesse_logic/navigation_menu/navigation_cubit.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = FirebaseService().currentUser;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (userState != null && !userState.emailVerified) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => VerifyEmail()),
          (route) => false,
        );
      }
    });

    return Scaffold(
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          switch (state) {
            case 0:
              return HomeScreen();
            case 1:
              return FindDonorsScreen();
            case 2:
              return ProfileScreen();
            default:
              return Container(color: GColors.primaryColor);
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Container(
            height: 80,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: BottomNavigationBar(
              selectedItemColor: GColors.primaryColor,
              backgroundColor: GColors.white,
              currentIndex: state,
              onTap: (index) {
                context.read<NavigationCubit>().navigateTo(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "الصفحة الرئيسية"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bloodtype), label: "المتبرعين"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.report), label: "حسابي"),
              ],
            ),
          );
        },
      ),
    );
  }
}
