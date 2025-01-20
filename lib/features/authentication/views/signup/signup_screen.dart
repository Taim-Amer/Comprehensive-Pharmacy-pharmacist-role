import 'package:comprehensive_pharmacy_pharmacy_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/otp_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/signup_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/signup_footer.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/signup_form.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signup/widgets/signup_header.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const SignupHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              const SignupForm(),
              TSizes.spaceBtwSections.verticalSpace,
              const SignupButton(),
              TSizes.spaceBtwSections.verticalSpace,
              const SignupFooter()
            ],
          ),
        ),
      ),
    );
  }
}
