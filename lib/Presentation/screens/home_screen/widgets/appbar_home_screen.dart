import 'package:blood_bank/constants/g_colors.dart';
import 'package:flutter/material.dart';

class AppBarHomeScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Container(
          height: 38,
          width: 38,
          padding: const EdgeInsets.only(left: 10.0),
          child: Stack(
            children: [
              Icon(Icons.notifications_none, size: 30),
              Positioned(
                top: 5,
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: GColors.primaryColor,
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
        )
      ],
      leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.window, color: GColors.primaryColor, size: 30)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
