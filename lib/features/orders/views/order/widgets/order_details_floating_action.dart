import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsFloatingAction extends StatelessWidget {
  const OrderDetailsFloatingAction({super.key, required this.orderID, required this.status});

  final String status;
  final int orderID;


  @override
  Widget build(BuildContext context) {
    return Obx(() => OrdersController.instance.isProcessing(state: status.obs) ? FloatingActionButton(
      onPressed: () => OrdersController.instance.onTheWay(orderID: orderID),
      child: const Text('Go'),
    ) : const SizedBox());
  }
}
