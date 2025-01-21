import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/shimmer_loader.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderShimmer extends StatelessWidget {
  const OrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: ListView.separated(
        itemCount: 10,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemBuilder: (context, index) => ShimmerLoader(width: double.infinity, height: 150.h),
        separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
      ),
    );
  }
}
