import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/icons/circular_icon.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TDrawerHeader extends StatelessWidget {
  const TDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TCircularIcon(
          icon: Iconsax.user,
          size: 16,
          color: Colors.white,
          backgroundColor: TColors.primary,
          width: 38.w,
          height: 38.h,
        ),
        TSizes.sm.horizontalSpace,
        TRoundedContainer(
          backgroundColor: Colors.transparent,
          height: 40.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12)),
              Text('+(964) 444-333-2', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
            ],
          ),
        ),
        const Spacer(),
        TCircularIcon(
          icon: Iconsax.edit,
          size: 16,
          color: Colors.white,
          backgroundColor: TColors.primary,
          width: 28.w,
          height: 28.h,
        ),
      ],
    );
  }
}
