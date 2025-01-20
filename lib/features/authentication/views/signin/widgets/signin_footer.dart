import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninFooter extends StatelessWidget {
  const SigninFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(TranslationKey.kSignupQuestion),
        TextButton(
          onPressed: () => Get.toNamed(AppRoutes.signup),
          child: Text(TranslationKey.kRegister),
        )
      ],
    );
  }
}
