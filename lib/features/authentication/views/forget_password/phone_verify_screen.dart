import 'package:comprehensive_pharmacy_pharmacy_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/widgets/phone_verify_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/widgets/phone_verify_header.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/signin/widgets/phone_country_code.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneVerifyScreen extends StatelessWidget {
  const PhoneVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: BackIcon()),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const PhoneVerifyHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              const PhoneCountryCode(),
              TSizes.spaceBtwItems.verticalSpace,
              const PhoneVerifyButton()
            ],
          ),
        ),
      ),
    );
  }
}
