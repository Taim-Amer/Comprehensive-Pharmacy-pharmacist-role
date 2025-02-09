import 'package:comprehensive_pharmacy_pharmacy_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/views/settings/widgets/select_languages_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/views/settings/widgets/settings_appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: SettingsAppbar()),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: const LanguageChangingContainer(),
      ),
    );
  }
}
