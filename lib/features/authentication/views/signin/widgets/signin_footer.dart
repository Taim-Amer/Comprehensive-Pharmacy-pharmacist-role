import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SigninFooter extends StatelessWidget {
  const SigninFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(TEnglishTexts.signupQuastion),
        TextButton(onPressed: (){}, child: Text(TEnglishTexts.register))
      ],
    );
  }
}
