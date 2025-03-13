import 'package:blood_bank/Presentation/screens/profile_screen/widgets/appbar_profile_screen.dart';
import 'package:blood_bank/Presentation/screens/profile_screen/widgets/settings_profile_screen.dart';
import 'package:blood_bank/Presentation/screens/profile_screen/widgets/user_details_profile.dart';
import 'package:blood_bank/Presentation/screens/profile_screen/widgets/user_image_profile.dart';
import 'package:blood_bank/Presentation/screens/profile_screen/widgets/user_location_profile.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/bisnesse_logic/get_user_data/get_user_data_cubit.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetUserDataCubit>().getUserData();
    return Scaffold(
      appBar: AppBarProfileScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: GSizes.screenPadding,
          child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
            builder: (context, state) {
              if (state is GetUserDataLoading) {
                return Center(child: customCircularProgressIndicator());
              } else if (state is GetUserDataLoaded) {
                return Column(
                  children: [
                    UserImageProfile(),
                    SizedBox(height: GSizes.spaceBetweenSections),
                    Text(state.user.username, style: GStyle.titleStyle),
                    SizedBox(height: GSizes.spaceBetweenItems),
                    UserLocationProfile(location: state.user.location),
                    SizedBox(height: GSizes.spaceBetweenSections),
                    UserDetailsProfile(
                        bloodType: state.user.bloodType,
                        donated: "00",
                        requested: "O+"),
                    SizedBox(height: GSizes.spaceBetweenSections),
                    SettingsProfileScreen(),
                  ],
                );
              }
              return Center(
                  child: Text("خطأ غير معروف", style: GStyle.subTitleStyle));
            },
          ),
        ),
      ),
    );
  }
}
