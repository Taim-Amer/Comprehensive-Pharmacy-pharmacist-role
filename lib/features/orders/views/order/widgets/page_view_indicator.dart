import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      count: 5,
      controller: OrdersController.instance.pageController,
      onDotClicked: OrdersController.instance.dotNavigationClick,
      effect: ExpandingDotsEffect(
        activeDotColor: TColors.primary,
        dotColor: TColors.borderPrimary,
        dotWidth: 12.w,
        dotHeight: 7.h,
      ),
    );
  }
}
