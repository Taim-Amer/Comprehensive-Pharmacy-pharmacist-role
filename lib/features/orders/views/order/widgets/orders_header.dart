import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      height: 125.h,
      backgroundColor: dark ? TColors.dark : TColors.softGrey,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      borderColor: TColors.primary,
      showBorder: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TranslationKey.kReady,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: dark ? TColors.light : const Color(0xFF383838),
                  ),
                ),
                Obx(() {
                  return Switch(
                    value: OrdersController.instance.readyStatus.value,
                    onChanged: (val) => OrdersController.instance.changeReady(),
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: Text(
              TranslationKey.kReady2,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: const Color(0xFF707070)),
            ),
          ),
        ],
      ),
    );
  }
}
