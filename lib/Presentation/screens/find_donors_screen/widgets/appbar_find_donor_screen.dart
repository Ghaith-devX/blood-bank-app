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
      centerTitle: true,
      title: Text(GText.titleFindDonorsScreen, style: GStyle.titleStyle),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
