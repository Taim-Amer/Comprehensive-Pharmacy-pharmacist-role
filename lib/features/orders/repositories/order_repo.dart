import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/change_ready_status_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/confirm_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/my_orders_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/reject_order_model.dart';

abstract class OrderRepo{
  Future<ChangeReadyStatusModel> changeReady();
  Future<MyOrdersModel> getMyOrders({String? status});
  Future<void> showOrder({required int orderID});
  Future<ConfirmOrderModel> confirmOrder({required int orderID});
  Future<RejectOrderModel> rejectOrder({required int orderID});
}