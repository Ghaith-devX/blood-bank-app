import 'package:blood_bank/Presentation/screens/auth/login_screen/login_screen.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutHandler extends StatelessWidget {
  const SignOutHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
        if (state is UserAuthSignOutSuccessState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showCustomSnackBar(context, "تم تسجيل الخروج!!");
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          });
        }
      },
      child: SizedBox(),
    );
  }
}
