import 'package:comprehensive_pharmacy_client_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/settings/widgets/select_languages_container.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/settings/widgets/settings_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/settings/widgets/settings_save_button.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: SettingsAppbar()),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            SelectLanguagesContainer(),
            TSizes.spaceBtwSections.verticalSpace,
            const SettingsSaveButton()
          ],
        ),
      ),
    );
  }
}
