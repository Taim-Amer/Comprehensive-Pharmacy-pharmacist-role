import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/assign_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/change_ready_status_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/confirm_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/delivery_price_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/driver_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/my_orders_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/order_details_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/order_price_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/reject_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/update_order_model.dart';

abstract class OrderRepo{
  Future<ChangeReadyStatusModel> changeReady();
  Future<MyOrdersModel> getMyOrders({String? status});
  Future<OrderDetailsModel> showOrder({required int orderID});
  Future<ConfirmOrderModel> confirmOrder({required int orderID});
  Future<RejectOrderModel> rejectOrder({required int orderID});
  Future<DriverModel> getDrivers();
  Future<AssignOrderModel> assignOrderToDriver({required int orderID, required int driverID});
  Future<UpdateOrderModel> updateOrder({required int orderID});
  Future<OrderPriceModel> addOrderPrice({required int orderID, required double price});
  Future<DeliveryPriceModel> setDeliveryPrice({required double price});
}