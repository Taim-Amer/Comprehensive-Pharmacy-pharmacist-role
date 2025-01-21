import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/confirm_order_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/location_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/note_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/order_item.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/photo_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/reject_order_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var orderDetails = OrdersController.instance.orderDetailsModel.value.data!;
    return Scaffold(
      appBar: TAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 30, child: BackIcon()),
            Text(TEnglishTexts.orderDetails, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20)),
            const SizedBox(width: 30)
          ],
        ),
      ),
      body: Column(
        children: [
          OrderItem(
            orderID: orderDetails.id!,
            orderDate: orderDetails.createdAt!,
            orderStatus: orderDetails.status!,
            customerName: orderDetails.customer?.name ?? 'Unknown',
            phoneNumber: orderDetails.customer?.phone ?? 'Unknown',
            showViewButton: false,
          ),
          TSizes.spaceBtwItems.verticalSpace,
          const PhotoContainer(),
          TSizes.spaceBtwItems.verticalSpace,
          const NoteContainer(),
          TSizes.spaceBtwItems.verticalSpace,
          const LocationContainer(),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
            child: Column(
              children: [
                const ConfirmOrderButton(),
                TSizes.spaceBtwItems.verticalSpace,
                const RejectOrderButton(),
              ],
            ),
          ),
          TSizes.spaceBtwItems.verticalSpace,
        ],
      ),
    );
  }
}
