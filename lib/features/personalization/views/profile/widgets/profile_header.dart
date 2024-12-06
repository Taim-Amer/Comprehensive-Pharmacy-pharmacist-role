import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TRoundedContainer(
          backgroundColor: TColors.primary,
          width: 116.w,
          height: 116.h,
          radius: 100,
          child: const Icon(Iconsax.user, size: 56, color: Colors.white,),
        ),
        TSizes.spaceBtwItems.verticalSpace,
        Text('Taim Amer', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20)),
        TSizes.sm.verticalSpace,
        Text('+(964) 444-333-222', style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
