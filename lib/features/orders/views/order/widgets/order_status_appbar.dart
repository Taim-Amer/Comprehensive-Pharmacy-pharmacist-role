import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OrderStatusAppbar extends StatelessWidget {
  const OrderStatusAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackIcon(),
        Text("Order status", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: dark ? TColors.light : const Color(0xFF383838))),
        const SizedBox()
      ],
    );
  }
}
