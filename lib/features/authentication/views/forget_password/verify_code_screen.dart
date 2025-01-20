import 'package:comprehensive_pharmacy_pharmacy_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/forget_password_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/widgets/verify_code_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/widgets/verify_code_footer.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/widgets/verify_code_header.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/otp_textfield.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: BackIcon()),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const VerifyCodeHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              OtpTextFieldWidget(controller: ForgetPasswordController.instance.otpController),
              TSizes.spaceBtwSections.verticalSpace,
              const VerifyCodeButton(),
              TSizes.spaceBtwSections.verticalSpace,
              const VerifyCodeFooter()
            ],
          ),
        ),
      ),
    );
  }
}
