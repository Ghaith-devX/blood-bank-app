import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class AppBarFindDonorScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarFindDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GColors.white,
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.all(8),
        color: GColors.whiteGrey,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: GColors.darkGrey),
        ),
      ),
      centerTitle: true,
      title: Text(GText.titleFindDonorsScreen, style: GStyle.titleStyle),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
