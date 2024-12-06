import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TFilterChip extends StatelessWidget {
  const TFilterChip({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return FilterChip(
      label: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: selected ? Colors.white : TColors.buttonPrimary,
        ),
      ),
      selected: selected,
      onSelected: (isSelected) {
        onSelected(isSelected);
      },
      selectedColor: TColors.buttonPrimary,
      backgroundColor: selected
          ? TColors.buttonPrimary
          : dark
          ? TColors.dark
          : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      side: const BorderSide(
        color: TColors.buttonPrimary,
      ),
    );
  }
}
