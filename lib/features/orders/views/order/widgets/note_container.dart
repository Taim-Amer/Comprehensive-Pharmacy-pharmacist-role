import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
      child: TRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(TSizes.md.w),
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(TImages.edit),
            TSizes.xs.horizontalSpace,
            Text(OrdersController.instance.orderDetailsModel.value.data?.description.toString() ?? "No Notes for this Order", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 14))
          ],
        ),
      ),
    );
  }
}
