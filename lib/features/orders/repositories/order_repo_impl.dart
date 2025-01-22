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
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/repositories/order_repo.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:get/get.dart';

class OrderRepoImpl implements OrderRepo{
  static OrderRepoImpl get instance => Get.find();

  final String? token = TCacheHelper.getData(key: 'token');
  final dioHelper = TDioHelper();

  @override
  Future<ChangeReadyStatusModel> changeReady() async{
    return await dioHelper.post(TApiConstants.change, {}, token: token).then((response) => ChangeReadyStatusModel.fromJson(response));
  }

  @override
  Future<ConfirmOrderModel> confirmOrder({required int orderID}) async{
    return await dioHelper.post(TApiConstants.confirm, {'order_id' : orderID}, token: token).then((response) => ConfirmOrderModel.fromJson(response));
  }

  @override
  Future<MyOrdersModel> getMyOrders({String? status}) async{
    return await dioHelper.get(TApiConstants.getOrders, queryParameters: {'status' : status}, token: token).then((response) => MyOrdersModel.fromJson(response));
  }

  @override
  Future<RejectOrderModel> rejectOrder({required int orderID}) async{
    return await dioHelper.post(TApiConstants.reject, {'order_id' : orderID}, token: token).then((response) => RejectOrderModel.fromJson(response));
  }

  @override
  Future<OrderDetailsModel> showOrder({required int orderID}) async{
    return await dioHelper.post(TApiConstants.showOrder, {'order_id' : orderID}, token: token).then((response) => OrderDetailsModel.fromJson(response));
  }

  @override
  Future<OrderPriceModel> addOrderPrice({required int orderID, required double price}) async{
    return await dioHelper.post(TApiConstants.addOrderPrice, {'order_id' : orderID, 'price' : price}, token: token).then((response) => OrderPriceModel.fromJson(response));
  }

  @override
  Future<AssignOrderModel> assignOrderToDriver({required int orderID, required int driverID}) async{
    return await dioHelper.post(TApiConstants.assignOrder, {'order_id' : orderID, 'driver_id' : driverID}, token: token).then((response) => AssignOrderModel.fromJson(response));
  }

  @override
  Future<DriverModel> getDrivers() async{
    return await dioHelper.get(TApiConstants.getDrivers, token: token).then((response) => DriverModel.fromJson(response));
  }

  @override
  Future<DeliveryPriceModel> setDeliveryPrice({required double price}) async{
    return await dioHelper.post(TApiConstants.addDeliveryPrice, {'delivery_price' : price}, token: token).then((response) => DeliveryPriceModel.fromJson(response));
  }

  @override
  Future<UpdateOrderModel> updateOrder({required int orderID}) async{
    return await dioHelper.post(TApiConstants.updateOrder, {'order_id' : orderID}, token: token).then((response) => UpdateOrderModel.fromJson(response));
  }
}