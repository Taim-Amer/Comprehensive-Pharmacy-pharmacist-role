import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RejectOrderButton extends StatelessWidget {
  const RejectOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => OrdersController.instance.reject(orderID: OrdersController.instance.orderDetailsModel.value.data!.id!),
        child: Text(TranslationKey.kRejected),
      ),
    );
  }
}
//OrdersController.instance.confirmApiStatus.value == RequestState.success || OrdersController.instance.rejectApiStatus.value == RequestState.success ? const SizedBox() :