import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_details_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const OrderDetailsScreen()),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace.w,
          vertical: TSizes.spaceBtwItems.h,
        ),
        child: TRoundedContainer(
          height: 150.h,
          showBorder: true,
          borderColor: const Color(0xFFE0E0E0),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(17),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TEnglishTexts.orderID, style: Theme.of(context).textTheme.titleLarge),
                  TRoundedContainer(
                    backgroundColor: TColors.primary.withOpacity(.2),
                    radius: 100.r,
                    height: 30.h,
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Text(TEnglishTexts.completed, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.primary, fontSize: 10, fontWeight: FontWeight.w500))),
                  )
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(TEnglishTexts.pharmacyName, style: Theme.of(context).textTheme.labelMedium),
                      Text("Ultramedica", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12)),
                    ],
                  ),
                  TRoundedContainer(
                    backgroundColor: const Color(0xFFE0E0E0),
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(TEnglishTexts.orderDate, style: Theme.of(context).textTheme.labelMedium),
                      Text("Tue , 10 Sept 12:20 PM", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
