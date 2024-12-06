import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class VerifyCodeFooter extends StatelessWidget {
  const VerifyCodeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(TEnglishTexts.checkPhoneQuastion),
          TextButton(onPressed: (){}, child: Text(TEnglishTexts.resend))
        ],
      ),
    );
  }
}
