import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      height: 125.h,
      backgroundColor: dark ? TColors.dark : TColors.softGrey,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(TEnglishTexts.readyToReceiveTitle, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: const Color(0xFF383838))),
                Switch(value: true, onChanged: (val){})
              ],
            ),
          ),
          Expanded(child: Text(TEnglishTexts.readyToReceiveSubTitle, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: const Color(0xFF707070)),))
        ],
      ),

    );
  }
}
