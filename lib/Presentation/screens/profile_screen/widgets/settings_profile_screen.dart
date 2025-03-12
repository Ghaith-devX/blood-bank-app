import 'package:blood_bank/Presentation/screens/profile_screen/widgets/signout_handler.dart';
import 'package:blood_bank/Presentation/screens/profile_screen/widgets/user_settings_profile.dart';
import 'package:blood_bank/bisnesse_logic/bloc_auth/user_auth_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsProfileScreen extends StatelessWidget {
  const SettingsProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      UserSettingsProfile(
          text: "متاح للتبرع", icon: Icons.alarm_sharp, onPressed: () {}),
      SizedBox(height: GSizes.spaceBetweenItems),
      UserSettingsProfile(
          text: "دعوة صديق", icon: Icons.group, onPressed: () {}),
      SizedBox(height: GSizes.spaceBetweenItems),
      UserSettingsProfile(
          text: "الحصول على مساعدة", icon: Icons.help_center, onPressed: () {}),
      SizedBox(height: GSizes.spaceBetweenItems),
      UserSettingsProfile(
          text: "تسجيل الخروج",
          icon: Icons.output_sharp,
          onPressed: () {
            context.read<UserAuthBloc>().add(UserAuthSignOutEvent());
          }),
      SignOutHandler(),
    ]);
  }
}
