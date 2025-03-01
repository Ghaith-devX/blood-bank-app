import 'package:blood_bank/Presentation/screens/auth/login_screen/login_screen.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarFindDonorScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarFindDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
        if (state is UserAuthSignOutSuccessState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
      child: AppBar(
        backgroundColor: GColors.white,
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.all(8),
          color: GColors.whiteGrey,
          child: IconButton(
            onPressed: () {
              context.read<UserAuthBloc>().add(UserAuthSignOutEvent());
            },
            icon: Icon(Icons.arrow_back_ios, color: GColors.darkGrey),
          ),
        ),
        centerTitle: true,
        title: Text(GText.titleFindDonorsScreen, style: GStyle.titleStyle),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
