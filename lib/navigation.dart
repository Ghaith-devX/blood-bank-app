import 'package:blood_bank/Presentation/screens/find_donors_screen/find_donors_screen.dart';
import 'package:blood_bank/Presentation/screens/profile_screen/profile_screen.dart';
import 'package:blood_bank/bisnesse_logic/navigation_menu/navigation_cubit.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          switch (state) {
            case 0:
              return Container(color: GColors.primaryColor);
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
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "بحث"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bloodtype), label: "المتبرعين"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.report), label: "التقارير"),
              ],
            ),
          );
        },
      ),
    );
  }
}
