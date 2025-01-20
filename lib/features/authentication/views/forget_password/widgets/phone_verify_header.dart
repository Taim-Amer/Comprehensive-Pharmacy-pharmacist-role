import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneVerifyHeader extends StatelessWidget {
  const PhoneVerifyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TranslationKey.kForgetPassword, style: Theme.of(context).textTheme.headlineMedium),
        TSizes.sm.verticalSpace,
        Text(TranslationKey.kForgetPasswordSubTitle, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
