import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordHandler extends StatelessWidget {
  const ResetPasswordHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthBloc, UserAuthState>(
      builder: (context, state) {
        if (state is UserAuthResetPasswordLoadingState) {
          return Center(child: customCircularProgressIndicator());
        } else if (state is UserAuthResetPasswordSuccessState) {
          showCustomSnackBar(
              context, "تم أرسال رابط إعادة التعيين الى بريدك الإلكتروني");
        } else if (state is UserAuthResetPasswordErrorState) {
          showCustomSnackBar(context, state.error);
        }
        return SizedBox();
      },
    );
  }
}
