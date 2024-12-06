import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
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
    return GestureDetector(
      onTap: (){
        onSelected(!selected);
      },
      child: TRoundedContainer(
        width: 189.w,
        height: 43.h,
        radius: 6.r,
        backgroundColor: selected ? TColors.buttonPrimary : dark ? TColors.dark : Colors.white,
        borderColor: TColors.buttonPrimary,
        showBorder: true,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: selected ? Colors.white : TColors.buttonPrimary),
          ),
        ),
      ),
    );
  }
}



