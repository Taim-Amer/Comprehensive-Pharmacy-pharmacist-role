import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/forget_password_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ForgetPasswordController.instance.passwordFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: ForgetPasswordController.instance.newPasswordController,
            validator: (value) => TValidator.validatePassword(value),
            enableInteractiveSelection: false,
            cursorColor: TColors.primary,
            decoration: InputDecoration(
                hintText: TranslationKey.kPassword,
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: const Icon(Iconsax.eye_slash, size: 22,)
            ),
          ),
          TSizes.spaceBtwInputField.verticalSpace,
          TextFormField(
            controller: ForgetPasswordController.instance.newPasswordConfirmController,
            validator: (value) => TValidator.validatePassword(value),
            enableInteractiveSelection: false,
            cursorColor: TColors.primary,
            decoration: InputDecoration(
                hintText: TranslationKey.kConfirmPassword,
                prefixIcon: const Icon(Iconsax.location),
                suffixIcon: const Icon(Iconsax.eye_slash, size: 22,)
            ),
          ),
        ],
      ),
    );
  }
}
