import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/orders_empty_body.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/orders_header.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EmptyOrderForm extends StatelessWidget {
  const EmptyOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrdersHeader(),
        OrdersEmptyBody(),
        SizedBox(height: TSizes.spaceBtwSections * 5)
      ],
    );
  }
}
