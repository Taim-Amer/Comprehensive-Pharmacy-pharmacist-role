import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpTextFieldWidget extends StatelessWidget {
  const OtpTextFieldWidget({super.key});

  // final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      fieldWidth: 50,
      fieldHeight: 60,
      showCursor: false,
      alignment: Alignment.center,
      numberOfFields: 5,
      borderRadius: BorderRadius.circular(12),
      focusedBorderColor: TColors.primary,
      showFieldAsBox: true,
      borderColor: TColors.primary,
      cursorColor: TColors.primary,
      onCodeChanged: (String code) {
      },
      onSubmit: (String code) {
        // controller.text = code;
      },
    );
  }
}
