import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/change_ready_status_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/my_orders_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/order_details_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/repositories/order_repo_impl.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_details_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/logging/logger.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find<OrdersController>();

  final pageController = PageController(viewportFraction: .8);
  Rx<int> currentPageIndex = 0.obs;
  Rx<bool> readyStatus = true.obs;

  Rx<RequestState> getMyOrdersApiStatus = RequestState.begin.obs;
  Rx<RequestState> changeReadyApiStatus = RequestState.begin.obs;
  Rx<RequestState> orderDetailsApiStatus = RequestState.begin.obs;

  final myOrdersModel = MyOrdersModel().obs;
  final changeReadyModel = ChangeReadyStatusModel().obs;
  final orderDetailsModel = OrderDetailsModel().obs;


  var selectedChips = <bool>[true, false, false, false].obs;
  var orderStatusChipList = <String>[
    TEnglishTexts.completed,
    TEnglishTexts.pending,
    TEnglishTexts.canceled,
    TEnglishTexts.rejected,
    TEnglishTexts.processing,
    TEnglishTexts.onTheWay,
  ].obs;

  var orderStatusChipList2 = <String>[
    "completed",
    "pending",
    "canceled",
    "rejected",
    "processing",
    "on the way",
  ].obs;

  @override
  void onReady() async{
    await getMyOrders();
    getMyOrders(status: "completed");
    getMyOrders(status: "pending");
    getMyOrders(status: "canceled");
    getMyOrders(status: "rejected");
    getMyOrders(status: "processing");
    getMyOrders(status: "on the way");
    super.onReady();
  }

  void toggleChipSelection(int index, bool isSelected) {
    selectedChips[index] = isSelected;
  }

  void updatePageIndicator(index) => currentPageIndex = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  Future<void> getMyOrders({String? status}) async{
    THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.getMyOrders(status: status).then((response){
      if(response.status == true){
        myOrdersModel.value = response;
        if (myOrdersModel.value.data is List && (myOrdersModel.value.data as List).isEmpty) {
          THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.noData);
        }
        THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.success);
      } else{
        THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<bool> changeReady() async{
    THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.changeReady().then((response){
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.success);
        if(response.data!.status == true){
          readyStatus.value = true;
        }else if(response.data!.status == false){
          readyStatus.value = false;
        }
      } else{
        THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.warning);
    });
    return readyStatus.value;
  }

  Future<void> showOrder({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: orderDetailsApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.showOrder(orderID: orderID).then((response){
      if(response.status == true){
        orderDetailsModel.value = response;
        THelperFunctions.updateApiStatus(target: orderDetailsApiStatus, value: RequestState.success);
        Get.to(() => const OrderDetailsScreen());
      } else{
        THelperFunctions.updateApiStatus(target: orderDetailsApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: orderDetailsApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }
}
