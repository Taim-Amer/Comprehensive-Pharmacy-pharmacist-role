import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/controllers/settings_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/views/settings/widgets/language_radio_tile.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageChangingContainer extends StatelessWidget {
  const LanguageChangingContainer({super.key});

  // final ValueNotifier<Language?> selectedLanguageNotifier = ValueNotifier<Language?>(Language.english);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      backgroundColor: dark ? TColors.dark : TColors.lightGrey,
      width: 394.w,
      height: 150.h,
      radius: 12.r,
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w, vertical: 31.h),
      child: Column(
        children: [
          Expanded(
            child: LanguageRadioTile(
              language: Language.english,
              languageName: TranslationKey.kEnglish,
              valueNotifier: SettingsController.instance.selectedLanguageNotifier,
              onChanged: (language){
                SettingsController.instance.setSelectedRadio(language!);
              },
            ),
          ),
          40.verticalSpace,
          Expanded(
            child: LanguageRadioTile(
              language: Language.arabic,
              languageName: TranslationKey.kArabic,
              valueNotifier: SettingsController.instance.selectedLanguageNotifier,
              onChanged: (language){
                SettingsController.instance.setSelectedRadio(language!);
              },
            ),
          ),
        ],
      ),
    );
  }
}



