import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_text.dart';
import 'package:blood_bank/navigation.dart';
import 'package:flutter/material.dart';

class VerificationSuccessPage extends StatelessWidget {
  const VerificationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: GSizes.screenPadding,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(image: AssetImage(GText.verifiedUrlImage)),
          SizedBox(height: GSizes.spaceBetweenSections * 2),
          CustomButton(
              text: GText.btnEnd,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => NavigationMenu()),
                    (route) => false);
              })
        ]),
      ),
    );
  }
}
