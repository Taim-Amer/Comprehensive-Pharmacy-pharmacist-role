import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderDetailsFloatingAction extends StatelessWidget {
  const OrderDetailsFloatingAction({super.key, required this.orderID, required this.status});

  final int orderID;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Obx(() => OrdersController.instance.isProcessing(state: status.obs) ? FloatingActionButton(
      onPressed: () => OrdersController.instance.onTheWay(orderID: orderID),
      child: Text('Go'),
    ) : const SizedBox());
  }
}
