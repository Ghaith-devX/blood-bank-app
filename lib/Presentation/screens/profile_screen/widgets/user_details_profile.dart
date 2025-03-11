import 'package:blood_bank/Presentation/screens/profile_screen/widgets/user_data_container.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class UserDetailsProfile extends StatelessWidget {
  const UserDetailsProfile({
    super.key,
    required this.bloodType,
    required this.donated,
    required this.requested,
  });
  final String bloodType, donated, requested;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      UserDataContainer(title: bloodType, subTitle: GText.bloodType),
      UserDataContainer(title: donated, subTitle: GText.timesDonated),
      UserDataContainer(title: requested, subTitle: GText.requested),
    ]);
  }
}
