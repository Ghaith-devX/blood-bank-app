import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: GStyle.primaryText)),
    );
  });
}
