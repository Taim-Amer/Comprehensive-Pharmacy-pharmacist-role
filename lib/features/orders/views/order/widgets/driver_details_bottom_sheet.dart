import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/confirm_delivery_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/total_cost_textfield.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/device/device_utility.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showDriverDetailsBottomsheet({required String name, required String phone, required double distance, required int driverID}){
  return showModalBottomSheet(
    isScrollControlled: true,
    context: Get.context!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Form(
        key: OrdersController.instance.costFormKey,
        child: SizedBox(
          height: 200.h + TDeviceUtils.getKeyboardHeight(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.headlineMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.flash_on),
                        Text(distance.toString()),
                      ],
                    ),
                  ],
                ),
                TSizes.spaceBtwItems.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Iconsax.mobile),
                    Text(TFormatter.formatPhoneNumber(phone)),
                  ],
                ),
                TSizes.spaceBtwSections.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TotalCostTextfield(),
                    TSizes.spaceBtwItems.horizontalSpace,
                    ConfirmDeliveryButton(driverID: driverID)
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}