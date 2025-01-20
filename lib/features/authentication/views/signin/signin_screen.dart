import 'package:comprehensive_pharmacy_pharmacy_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/new_password_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signin/widgets/signin_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signin/widgets/signin_footer.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signin/widgets/signin_form.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signin/widgets/signin_header.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SigninHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              const SigninForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => Get.to(const NewPasswordScreen()), child: Text(TEnglishTexts.forgetPassword))
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              const SigninButton(),
              TSizes.spaceBtwSections.verticalSpace,
              const SigninFooter()
            ],
          ),
        ),
      ),
    );
  }
}
