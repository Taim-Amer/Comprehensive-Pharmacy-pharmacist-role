import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/loading_widget.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConfirmOrderButton extends StatelessWidget {
  const ConfirmOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => OrdersController.instance.confirmApiStatus.value == RequestState.loading || OrdersController.instance.getDriversApiStatus.value == RequestState.loading ? const LoadingWidget() : SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => OrdersController.instance.confirm(orderID: OrdersController.instance.orderDetailsModel.value.data!.id!).then((value) => OrdersController.instance.getDrivers()),
        child: Text(TEnglishTexts.confirmOrder),
      ),
    ));
  }
}