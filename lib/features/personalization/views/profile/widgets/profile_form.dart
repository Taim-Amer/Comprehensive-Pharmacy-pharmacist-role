import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          decoration: InputDecoration(
            hintText: TranslationKey.kUserName,
            prefixIcon: const Icon(Iconsax.user),
          ),
        ),
        // TSizes.spaceBtwInputField.verticalSpace,
        // const PhoneCountryCode(controller: null,),
        TSizes.spaceBtwInputField.verticalSpace,
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          decoration: InputDecoration(
            hintText: TranslationKey.kEmailAddress,
            prefixIcon: const Icon(Iconsax.message),
          ),
        ),
        TSizes.spaceBtwInputField.verticalSpace,
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          decoration: InputDecoration(
              hintText: TranslationKey.kLocation,
              prefixIcon: const Icon(Iconsax.location),
              suffixIcon: const Icon(Icons.keyboard_arrow_right_outlined, size: 22,)
          ),
        ),
      ],
    );
  }
}
