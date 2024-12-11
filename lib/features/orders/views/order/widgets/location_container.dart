import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
      child: TRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(TSizes.md.w),
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Iconsax.edit, size: 20, color: Color(0xFF383838)),
                TSizes.xs.horizontalSpace,
                Text(TEnglishTexts.locationCustomer, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 14))
              ],
            ),
            TSizes.xs.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Iconsax.edit, size: 20, color: Colors.transparent),
                TSizes.xs.horizontalSpace,
                Text(TEnglishTexts.locationCustomer, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
