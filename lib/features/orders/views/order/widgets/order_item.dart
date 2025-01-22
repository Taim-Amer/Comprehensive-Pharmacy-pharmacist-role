import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_details_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, this.showViewButton = true, required this.orderID, required this.orderDate, required this.orderStatus, required this.customerName, required this.phoneNumber});

  final bool showViewButton;
  final int orderID;
  final String orderDate;
  final String orderStatus;
  final String customerName;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace.w,
        vertical: TSizes.spaceBtwItems.h,
      ),
      child: TRoundedContainer(
        // height: 150.h,
        showBorder: true,
        borderColor: const Color(0xFFE0E0E0),
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customerName, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                    Text("${TEnglishTexts.orderNo} #[$orderID]", style: Theme.of(context).textTheme.labelLarge)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Iconsax.mobile, size: 20),
                        TSizes.xs.horizontalSpace,
                        Text(phoneNumber, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    // Text(TEnglishTexts.orderNo, style: Theme.of(context).textTheme.labelLarge)
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TRoundedContainer(
                width: double.infinity,
                height: 1.h,
                backgroundColor: TColors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(TEnglishTexts.orderDate, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(orderDate, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 12)),
                  ],
                ),
              ],
            ),
            orderStatus == "completed" ? TSizes.xs.verticalSpace : const SizedBox(),
            orderStatus == "completed" ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(TEnglishTexts.finalPrice, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(orderDate, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 12)),
                  ],
                ),
              ],
            ) : const SizedBox(),
            TSizes.md.verticalSpace,
            showViewButton ? SizedBox(
              height: 36.h,
              child: ElevatedButton(onPressed: () => OrdersController.instance.showOrder(orderID: orderID), child: Text(TEnglishTexts.viewOrders)),
              // child: ElevatedButton(onPressed: () => THelperFunctions.getPlaceName(33.4673200, 36.3380500), child: Text(TEnglishTexts.viewOrders)),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
