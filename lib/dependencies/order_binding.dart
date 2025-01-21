import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/repositories/order_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<OrdersController>(OrdersController());
    Get.put<OrderRepoImpl>(OrderRepoImpl());
  }

}