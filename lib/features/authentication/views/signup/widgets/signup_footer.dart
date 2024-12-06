import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(TEnglishTexts.signinQuastion),
        TextButton(onPressed: (){}, child: Text(TEnglishTexts.login))
      ],
    );
  }
}
