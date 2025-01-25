import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/forms/empty_form.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/assign_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/change_ready_status_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/confirm_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/driver_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/my_orders_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/order_details_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/order_price_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/reject_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/models/update_order_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/repositories/order_repo_impl.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/drivers_map.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_details_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_status_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/logging/logger.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
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
  Rx<RequestState> confirmApiStatus = RequestState.begin.obs;
  Rx<RequestState> rejectApiStatus = RequestState.begin.obs;
  Rx<RequestState> updateOrderApiStatus = RequestState.begin.obs;
  Rx<RequestState> getDriversApiStatus = RequestState.begin.obs;
  Rx<RequestState> assignApiStatus = RequestState.begin.obs;
  Rx<RequestState> addPriceApiStatus = RequestState.begin.obs;
  Rx<RequestState> onWayApiStatus = RequestState.begin.obs;

  final myOrdersModel = MyOrdersModel().obs;
  final changeReadyModel = ChangeReadyStatusModel().obs;
  final orderDetailsModel = OrderDetailsModel().obs;
  final confirmModel = ConfirmOrderModel().obs;
  final rejectModel = RejectOrderModel().obs;
  final updateOrderModel = UpdateOrderModel().obs;
  final driversModel = DriverModel().obs;
  final assignModel = AssignOrderModel().obs;
  final addPriceModel = OrderPriceModel().obs;
  final onWayModel = UpdateOrderModel().obs;

  final costController = TextEditingController();
  GlobalKey<FormState> costFormKey = GlobalKey<FormState>();


  var selectedChips = <bool>[true, false, false, false].obs;
  var orderStatusChipList = <String>[
    TEnglishTexts.newOrders,
    TEnglishTexts.finishedOrders,
    TEnglishTexts.rejected,
    TEnglishTexts.currentOrders,
    TEnglishTexts.onTheWay,
  ].obs;

  var orderStatusChipList2 = <String>[
    "pending",
    "completed",
    "rejected",
    "Processing",
    "on the way",
  ].obs;

  //return FlutterMap(
  //       options: const MapOptions(),
  //       children: [
  //         TileLayer(
  //           urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  //           userAgentPackageName: 'com.example.app',
  //         ),
  //       ],
  //     );

  @override
  void onReady() async{
    await getMyOrders();
    getMyOrders(status: "pending");
    getMyOrders(status: "completed");
    // getMyOrders(status: "canceled");
    getMyOrders(status: "rejected");
    getMyOrders(status: "processing");
    getMyOrders(status: "on the way");
    super.onReady();
  }

  bool isPending({required String state}){
    return state == orderStatusChipList2[0] ? true : false;
  }

  bool isProcessing({required RxString state}){
    return state.value == "Processing" ? true : false;
  }

  void toggleChipSelection(int index, bool isSelected) {
    selectedChips[index] = isSelected;
  }

  void updatePageIndicator(index) => currentPageIndex = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  Widget emptyForm(String status){
    Widget empty = TEmptyForm(image: TImages.newOrderEmpty, title: TEnglishTexts.newOrdersEmptyTitle, subTitle: TEnglishTexts.newOrdersEmptySubTitle);
    if(status == orderStatusChipList2[0]){
      empty = TEmptyForm(image: TImages.newOrderEmpty, title: TEnglishTexts.newOrdersEmptyTitle, subTitle: TEnglishTexts.newOrdersEmptySubTitle);
    } else if(status == orderStatusChipList2[1]){
      empty = TEmptyForm(image: TImages.finishedOrderEmpty, title: TEnglishTexts.finishedOrdersEmptyTitle, subTitle: TEnglishTexts.finishedOrdersEmptySubTitle);
    } else if(status == orderStatusChipList2[2]){
      empty = TEmptyForm(image: TImages.rejectedOrderEmpty, title: TEnglishTexts.rejectedOrdersEmptyTitle, subTitle: TEnglishTexts.rejectedOrdersEmptySubTitle);
    } else if(status == orderStatusChipList2[3]){
      empty = TEmptyForm(image: TImages.currentOrderEmpty, title: TEnglishTexts.currentOrdersEmptyTitle, subTitle: TEnglishTexts.currentOrdersEmptySubTitle);
    } else if(status == orderStatusChipList2[4]){
      empty = TEmptyForm(image: TImages.newOrderEmpty, title: TEnglishTexts.onTheWayOrdersEmptyTitle, subTitle: TEnglishTexts.onTheWayOrdersEmptySubTitle);
    }
    return empty;
  }

  Future<void> getMyOrders({String? status}) async{
    THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.getMyOrders(status: status).then((response){
      if(response.status == true){
        myOrdersModel.value = response;
        if (myOrdersModel.value.data is List && (myOrdersModel.value.data as List).isEmpty) {
          THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.loading);
          THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.noData);
          emptyForm(status!);
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

  Future<void> confirm({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: confirmApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.confirmOrder(orderID: orderID).then((response){
      if(response.status == true){
        confirmModel.value = response;
        THelperFunctions.updateApiStatus(target: confirmApiStatus, value: RequestState.success);
        Get.to(() => DriversMap(drivers: driversModel.value.drivers ?? []), transition: Transition.rightToLeft);
        TCacheHelper.saveData(key: 'order_id', value: orderID);
        getMyOrders(status: "pending");
      } else{
        THelperFunctions.updateApiStatus(target: confirmApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: confirmApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> reject({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: rejectApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.rejectOrder(orderID: orderID).then((response){
      if(response.status == true){
        rejectModel.value = response;
        THelperFunctions.updateApiStatus(target: rejectApiStatus, value: RequestState.success);
        Get.back();
        getMyOrders(status: "pending");
        showSnackBar(response.message ?? '', AlertState.success);
      } else{
        THelperFunctions.updateApiStatus(target: rejectApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: rejectApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> updateOrder({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: updateOrderApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.updateOrder(orderID: orderID).then((response){
      if(response.status == true){
        updateOrderModel.value = response;
        THelperFunctions.updateApiStatus(target: updateOrderApiStatus, value: RequestState.success);
        showSnackBar(response.message ?? '', AlertState.success);
      } else{
        THelperFunctions.updateApiStatus(target: updateOrderApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: updateOrderApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> getDrivers() async{
    THelperFunctions.updateApiStatus(target: getDriversApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.getDrivers().then((response){
      if(response.status == true){
        driversModel.value = response;
        THelperFunctions.updateApiStatus(target: getDriversApiStatus, value: RequestState.success);
        // Get.to(() => DriversMap(drivers: response.drivers ?? []), transition: Transition.rightToLeft);
      } else{
        THelperFunctions.updateApiStatus(target: getDriversApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: getDriversApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> assign({required int driverID}) async{
    THelperFunctions.updateApiStatus(target: assignApiStatus, value: RequestState.loading);
    if(!costFormKey.currentState!.validate()){
      THelperFunctions.updateApiStatus(target: assignApiStatus, value: RequestState.begin);
      return;
    }
    await OrderRepoImpl.instance.assignOrderToDriver(orderID: TCacheHelper.getData(key: 'order_id'), driverID: driverID).then((response){
      if(response.status == true){
        assignModel.value = response;
        THelperFunctions.updateApiStatus(target: assignApiStatus, value: RequestState.success);
        Get.offAll(() => const OrderStatusScreen(), transition: Transition.rightToLeft);
      } else{
        THelperFunctions.updateApiStatus(target: assignApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: assignApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> setPrice() async{
    THelperFunctions.updateApiStatus(target: addPriceApiStatus, value: RequestState.loading);
    if(!costFormKey.currentState!.validate()){
      THelperFunctions.updateApiStatus(target: addPriceApiStatus, value: RequestState.begin);
      return;
    }
    await OrderRepoImpl.instance.addOrderPrice(orderID: TCacheHelper.getData(key: 'order_id'), price: double.tryParse(costController.text)!).then((response){
      if(response.status == true){
        addPriceModel.value = response;
        THelperFunctions.updateApiStatus(target: addPriceApiStatus, value: RequestState.success);
      } else{
        THelperFunctions.updateApiStatus(target: addPriceApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: addPriceApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> onTheWay({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: onWayApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.updateOrder(orderID: orderID).then((response){
      if(response.status == true){
        onWayModel.value = response;
        THelperFunctions.updateApiStatus(target: onWayApiStatus, value: RequestState.success);
        Get.toNamed(AppRoutes.order);
        showSnackBar(response.message ?? '', AlertState.success);
      } else{
        THelperFunctions.updateApiStatus(target: onWayApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: onWayApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }
}
