import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/dashed_divider.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/step_row.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
class OrderStatusBody extends StatelessWidget {
  const OrderStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepRow(
          title: TEnglishTexts.processingTitle,
          description: TEnglishTexts.processingSubTitle,
          icon: TImages.processing,
          isCompleted: true,
        ),
        const DashedDivider(),
        StepRow(
          title: TEnglishTexts.onWayTitle,
          description: TEnglishTexts.onWaySubTitle,
          icon: TImages.onTheWay,
          isCompleted: true,
        ),
        const DashedDivider(),
        StepRow(
          title: TEnglishTexts.deliveredTitle,
          description: TEnglishTexts.deliveredSubTitle,
          icon: TImages.delivery,
          isCompleted: false,
        ),
      ],
    );
  }
}
