import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/general_appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: GeneralAppbar()),
      drawer: const GeneralDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(TImages.notificationEmpty),
            TSizes.spaceBtwSections.verticalSpace,
            Text(TEnglishTexts.notificationsEmptyTitle, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
            TSizes.spaceBtwItems.verticalSpace,
            Text(TEnglishTexts.notificationsEmptySubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
