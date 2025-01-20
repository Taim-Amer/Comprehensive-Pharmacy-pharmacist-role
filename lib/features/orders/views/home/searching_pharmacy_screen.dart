import 'package:comprehensive_pharmacy_pharmacy_role/app.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchingPharmacyScreen extends StatelessWidget {
  const SearchingPharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(TImages.searchLoading),
            TSizes.spaceBtwSections.verticalSpace,
            Text(TEnglishTexts.searchingTitle, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
            TSizes.spaceBtwItems.verticalSpace,
            Text(TEnglishTexts.searchingSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
            TSizes.spaceBtwSections.verticalSpace,
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(OrderScreen()),
                child: Text(TEnglishTexts.cancelOrder),
              ),
            )
          ],
        ),
      ),
    );
  }
}
