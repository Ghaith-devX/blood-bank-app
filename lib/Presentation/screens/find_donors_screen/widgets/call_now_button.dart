import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class CallNowButton extends StatelessWidget {
  const CallNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: WidgetStatePropertyAll(GColors.tealGray)),
        onPressed: () {},
        child: Row(
          children: [
            Icon(Icons.call_end, color: GColors.white),
            SizedBox(width: GSizes.spaceBetweenItems),
            Text(GText.callNow, style: GStyle.btnTextStyle)
          ],
        ));
  }
}
