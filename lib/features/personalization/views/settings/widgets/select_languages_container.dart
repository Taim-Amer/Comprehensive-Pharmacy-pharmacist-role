import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/views/settings/widgets/language_radio_tile.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguagesContainer extends StatelessWidget {
  SelectLanguagesContainer({super.key});

  final ValueNotifier<Language?> selectedLanguageNotifier = ValueNotifier<Language?>(Language.english);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      backgroundColor: dark ? TColors.dark : const Color(0xFFF3F3F3),
      width: double.infinity,
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: TSizes.md.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LanguageRadioTile(
            language: Language.english,
            languageName: TEnglishTexts.english,
            valueNotifier: selectedLanguageNotifier,
          ),
          LanguageRadioTile(
            language: Language.arabic,
            languageName: TEnglishTexts.arabic,
            valueNotifier: selectedLanguageNotifier,
          ),
        ],
      ),
    );
  }
}

