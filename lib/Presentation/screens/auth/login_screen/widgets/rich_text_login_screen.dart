import 'package:blood_bank/Presentation/screens/auth/signup_screen/signup_screen.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class RichTextLoginScreen extends StatelessWidget {
  const RichTextLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: GText.richTextOne, style: GStyle.subTitleStyle),
          WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text(GText.richTextTwo, style: GStyle.primaryText),
              ))
        ]),
      ),
    );
  }
}
