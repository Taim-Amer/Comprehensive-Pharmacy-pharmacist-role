import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDescriptionColumn extends StatelessWidget {
  const OrderDescriptionColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TEnglishTexts.orderID, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
            TRoundedContainer(
              backgroundColor: TColors.primary.withOpacity(.3),
              radius: 100.r,
              height: 30.h,
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(TEnglishTexts.completed, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.primary, fontSize: 10, fontWeight: FontWeight.w500))),
            )
          ],
        ),
        Text("Tue , 10 Sept 12:20 PM", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16)),
        TSizes.spaceBtwSections.verticalSpace,
        Text(TEnglishTexts.pharmacyName, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
        Text("Ultramedica", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16)),
      ],
    );
  }
}
