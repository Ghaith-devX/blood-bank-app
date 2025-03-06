import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: WidgetStatePropertyAll(GColors.primaryColor)),
        onPressed: () {},
        child: Row(
          children: [
            Icon(Icons.arrow_back, color: GColors.white),
            SizedBox(width: GSizes.spaceBetweenItems),
            Text(GText.requestButton, style: GStyle.btnTextStyle)
          ],
        ));
  }
}
