import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/otp_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Get.to(OtpScreen()),
        child: Text(TEnglishTexts.register),
      ),
    );
  }
}
