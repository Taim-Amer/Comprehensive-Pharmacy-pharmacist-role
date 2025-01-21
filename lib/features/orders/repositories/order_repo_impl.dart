import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/change_ready_status_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/confirm_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/my_orders_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/order_details_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/reject_order_model.dart';
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
}