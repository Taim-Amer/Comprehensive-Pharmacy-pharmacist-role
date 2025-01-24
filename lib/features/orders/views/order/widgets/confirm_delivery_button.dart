import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/loading_widget.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/device/device_utility.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDeliveryButton extends StatelessWidget {
  const ConfirmDeliveryButton({super.key, required this.driverID});

  final int driverID;

  @override
  Widget build(BuildContext context) {
    return Obx(() => OrdersController.instance.assignApiStatus.value == RequestState.loading ? const Expanded(flex: 1, child: Center(child: LoadingWidget())) : Expanded(child: SizedBox(
      height: 50.h,
      child: ElevatedButton(
        onPressed: () async{
          TDeviceUtils.hideKeyboard(context);
          await OrdersController.instance.setPrice();
          OrdersController.instance.assign(driverID: driverID);
        },
        child: Text(TEnglishTexts.confirmDelivery),
      ),
    )));
  }
}
