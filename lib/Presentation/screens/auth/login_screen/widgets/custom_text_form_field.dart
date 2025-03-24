import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.icon,
      this.controller,
      this.validator});
  final String text;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          validator: validator,
          controller: controller,
          autofocus: false,
          decoration: InputDecoration(
              fillColor: GColors.white,
              filled: true,
              hintText: text,
              hintStyle: GStyle.subTitleStyle,
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        )),
        SizedBox(width: 10),
        Icon(icon, color: GColors.primaryColor, size: 28),
      ]),
    );
  }
}
