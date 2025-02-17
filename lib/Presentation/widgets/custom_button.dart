import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(GColors.primaryColor)),
          onPressed: onPressed,
          child: Text(text, style: GStyle.btnTextStyle)),
    );
  }
}
