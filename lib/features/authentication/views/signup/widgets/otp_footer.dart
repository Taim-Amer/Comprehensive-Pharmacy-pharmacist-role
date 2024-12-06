import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class OtpFooter extends StatelessWidget {
  const OtpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(TEnglishTexts.otpQuastion),
          TextButton(onPressed: (){}, child: Text(TEnglishTexts.resend))
        ],
      ),
    );
  }
}
