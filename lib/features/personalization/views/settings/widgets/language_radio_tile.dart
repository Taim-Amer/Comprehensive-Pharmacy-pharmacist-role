import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/radio_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class LanguageRadioTile extends StatelessWidget {
  const LanguageRadioTile({
    super.key,
    required this.language,
    required this.languageName,
    required this.valueNotifier,
  });

  final Language language;
  final String languageName;
  final ValueNotifier<Language?> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(languageName),
        TRadioButton(
          enumValue: language,
          valueNotifier: valueNotifier,
        ),
      ],
    );
  }
}

