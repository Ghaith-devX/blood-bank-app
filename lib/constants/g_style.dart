import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class GStyle {
  static const TextStyle titleStyle = TextStyle(
      color: GColors.blackishGrey,
      fontFamily: GText.myFont,
      fontWeight: FontWeight.bold,
      fontSize: 20);

  static const TextStyle subTitleStyle = TextStyle(
      fontSize: 15,
      color: GColors.darkGrey,
      fontFamily: GText.myFont,
      fontWeight: FontWeight.normal,
      height: 1.8);
  static const TextStyle unselectedLabelStyle = TextStyle(
      fontSize: 13,
      color: GColors.darkGrey,
      fontFamily: GText.myFont,
      fontWeight: FontWeight.normal,
      height: 1.8);

  static const TextStyle btnTextStyle = TextStyle(
      fontFamily: GText.myFont,
      fontSize: 16,
      color: GColors.white,
      fontWeight: FontWeight.bold);

  static const TextStyle titleProfileScreen = TextStyle(
      fontFamily: GText.myFont, fontSize: 25, fontWeight: FontWeight.bold);

  static const TextStyle primaryText =
      TextStyle(color: GColors.primaryColor, fontFamily: GText.myFont);
}
