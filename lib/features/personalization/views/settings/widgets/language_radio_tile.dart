import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/radio_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class LanguageRadioTile extends StatelessWidget {
  const LanguageRadioTile({
    super.key,
    required this.language,
    required this.languageName,
    required this.valueNotifier,
    this.onChanged,
  });

  final Language language;
  final String languageName;
  final ValueNotifier<Language?> valueNotifier;
  final void Function(Language?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(languageName),
        TRadioButton<Language>(
          enumValue: language,
          valueNotifier: valueNotifier,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

