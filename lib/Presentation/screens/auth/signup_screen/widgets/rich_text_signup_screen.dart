import 'package:blood_bank/Presentation/screens/auth/login_screen/login_screen.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:flutter/material.dart';

class RichTextSignupScreen extends StatelessWidget {
  const RichTextSignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: GText.richTextOneSignupScreen, style: GStyle.subTitleStyle),
          WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(GText.richTextTwoSignupScreen,
                    style: GStyle.primaryText),
              ))
        ]),
      ),
    );
  }
}
