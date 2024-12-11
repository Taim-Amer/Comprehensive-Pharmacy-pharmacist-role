import 'package:comprehensive_pharmacy_pharmacy_role/common/screens/common_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordConfirmedScreen extends StatelessWidget {
  const PasswordConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      image: TImages.passwordConfirmed,
      title: TEnglishTexts.resetSuccess,
      subTitle: TEnglishTexts.resetSuccessSubTitle,
      showButton: true,
      buttonString: TEnglishTexts.login,
      function: () => Get.toNamed(AppRoutes.signin),
    );
  }
}
