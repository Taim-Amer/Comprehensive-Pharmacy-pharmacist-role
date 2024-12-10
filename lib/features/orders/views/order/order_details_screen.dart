import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/order_description_column.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/order_details_page_view.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/order_item.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/page_view_indicator.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/photo_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: TAppBar(
        // showBackArrow: true,
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
          const OrderItem(showViewButton: false),
          TSizes.spaceBtwItems.verticalSpace,
          const PhotoContainer()
        ],
      ),
    );
  }
}
