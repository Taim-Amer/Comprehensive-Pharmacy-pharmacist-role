import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordHeader extends StatelessWidget {
  const NewPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TranslationKey.kSetNewPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
        TSizes.sm.verticalSpace,
        Text(TranslationKey.kSetNewPasswordSubTitle, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
