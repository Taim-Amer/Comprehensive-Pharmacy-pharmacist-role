import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/exports.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/validators/validation.dart';
import 'package:flutter/material.dart';

class TotalCostTextfield extends StatelessWidget {
  const TotalCostTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SizedBox(
      height: 50.h,
      child: TextFormField(
        controller: OrdersController.instance.costController,
        validator: (value) => TValidator.validateEmptyText(value, TEnglishTexts.totalCost),
        enableInteractiveSelection: false,
        cursorColor: TColors.primary,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: TEnglishTexts.totalCost,
          prefixIcon: const Icon(Icons.monetization_on),
        ),
      ),
    ));
  }
}
