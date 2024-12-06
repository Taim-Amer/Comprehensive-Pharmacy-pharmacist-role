import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/order_item.dart';
import 'package:flutter/material.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, index) => const OrderItem(),
    );
  }
}
