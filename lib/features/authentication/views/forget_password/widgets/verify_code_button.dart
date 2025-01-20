import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/password_confirmed_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyCodeButton extends StatelessWidget {
  const VerifyCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(onPressed: () => Get.to(PasswordConfirmedScreen()), child: Text(TEnglishTexts.tcontinue)),
    );
  }
}
