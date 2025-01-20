import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderStatusNavbar extends StatelessWidget {
  const OrderStatusNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(onPressed: () => Get.to(const OrderScreen()), child: Text(TEnglishTexts.confirmDelivery)),
      ),
    );
  }
}
