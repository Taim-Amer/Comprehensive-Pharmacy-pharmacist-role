import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/widgets/phone_country_code.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
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
            hintText: TEnglishTexts.userName,
            prefixIcon: const Icon(Iconsax.user),
          ),
        ),
        TSizes.spaceBtwInputField.verticalSpace,
        const PhoneCountryCode(),
        // TSizes.spaceBtwInputField.verticalSpace,
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          decoration: InputDecoration(
            hintText: TEnglishTexts.emailAddress,
            prefixIcon: const Icon(Iconsax.message),
          ),
        ),
        TSizes.spaceBtwInputField.verticalSpace,
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          decoration: InputDecoration(
              hintText: TEnglishTexts.location,
              prefixIcon: const Icon(Iconsax.location),
              suffixIcon: const Icon(Icons.keyboard_arrow_right_outlined, size: 22,)
          ),
        ),
      ],
    );
  }
}
