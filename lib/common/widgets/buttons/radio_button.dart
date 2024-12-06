import 'package:flutter/material.dart';

class TRadioButton extends StatelessWidget {
  const TRadioButton({
    super.key,
    required this.enumValue,
    required this.valueNotifier,
  });

  final Enum enumValue;
  final ValueNotifier<Enum?> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Enum?>(
      valueListenable: valueNotifier,
      builder: (context, selectedValue, child) {
        return Radio<Enum>(
          value: enumValue,
          groupValue: selectedValue,
          onChanged: (Enum? newValue) {
            if (newValue != null) {
              valueNotifier.value = newValue;
            }
          },
        );
      },
    );
  }
}
