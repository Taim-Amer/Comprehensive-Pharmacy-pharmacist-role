import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersEmptyBody extends StatelessWidget {
  const OrdersEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(TImages.emptyOrders),
        TSizes.spaceBtwItems.verticalSpace,
        Text(TranslationKey.kEmptyOrders, style: Theme.of(context).textTheme.titleLarge),
        TSizes.sm.verticalSpace,
        SizedBox(
          width: THelperFunctions.screenWidth(context) / 1.5,
          child: Text(TranslationKey.kEmptyOrdersSubTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        TSizes.spaceBtwItems.verticalSpace,
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: (){},
            child: Text(TranslationKey.kCreateOrder),
          ),
        )
      ],
    );
  }
}
