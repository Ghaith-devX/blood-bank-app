import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginHandler extends StatelessWidget {
  const LoginHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
        if (state is UserAuthErrorState) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            showCustomSnackBar(context, state.error);
          });
        } else if (state is UserAuthSignInSuccessState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showCustomSnackBar(context, "تم تسجيل الدخول بنجاح!");
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NavigationMenu()),
                (route) => false);
          });
        }
      },
      child:
          BlocBuilder<UserAuthBloc, UserAuthState>(builder: (context, state) {
        if (state is UserAuthLoadingState) {
          return Center(child: customCircularProgressIndicator());
        }
        return Container();
      }),
    );
  }
}
