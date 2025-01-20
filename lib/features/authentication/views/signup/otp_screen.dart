import 'package:comprehensive_pharmacy_pharmacy_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/otp_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/signup_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/otp_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/otp_footer.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/otp_header.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/otp_textfield.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OtpHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              OtpTextFieldWidget(controller: OtpController.instance.otpController),
              TSizes.spaceBtwSections.verticalSpace,
              const OtpButton(),
              TSizes.spaceBtwSections.verticalSpace,
              const OtpFooter()
            ],
          ),
        ),
      ),
    );
  }
}
