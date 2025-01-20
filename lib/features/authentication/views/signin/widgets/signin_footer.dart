import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/signup_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/home/home_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninFooter extends StatelessWidget {
  const SigninFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(TEnglishTexts.signupQuastion),
        TextButton(
          onPressed: () => Get.to(SignupScreen()),
          child: Text(TEnglishTexts.register),
        )
      ],
    );
  }
}
