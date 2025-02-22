import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.text, required this.icon, this.controller});
  final String text;
  final IconData icon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: GColors.warmWhite, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          Expanded(
              child: TextFormField(
            controller: controller,
            autofocus: false,
            decoration: InputDecoration(
                hintText: text,
                hintStyle: GStyle.subTitleStyle,
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          )),
          Text(
            "|",
            style: TextStyle(fontSize: 20, color: GColors.grey),
          ),
          SizedBox(width: 5),
          Icon(
            icon,
            color: GColors.primaryColor,
            size: 28,
          ),
        ]),
      ),
    );
  }
}
