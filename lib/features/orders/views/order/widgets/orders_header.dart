import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSizes.md.verticalSpace,
        Row(
          children: [
            SvgPicture.asset(TImages.myOrdersIcon, color: dark ? TColors.light : const Color(0xFF383838),),
            TSizes.xs.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TEnglishTexts.myOrders, style: Theme.of(context).textTheme.bodyLarge),
                Text(TEnglishTexts.previousOrders, style: Theme.of(context).textTheme.labelLarge),
              ],
            )
          ],
        ),
      ],
    );
  }
}
