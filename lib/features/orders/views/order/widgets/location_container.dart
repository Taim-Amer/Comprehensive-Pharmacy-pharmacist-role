import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/user_location_map.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var place = OrdersController.instance.orderDetailsModel.value.data;
    double? lat = double.tryParse(place?.customer?.lat ?? '');
    double? lng = double.tryParse(place?.customer?.lng ?? '');

    return GestureDetector(
      onTap: () => Get.to(UserLocationMap(latitude: lat!, longitude: lng!,), transition: Transition.rightToLeft),
      child: Padding(
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
                  const Icon(Iconsax.location, size: 16, color: Color(0xFF383838)),
                  TSizes.xs.horizontalSpace,
                  Text(
                    TranslationKey.kLocation,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Iconsax.location, size: 20, color: Colors.transparent),
                  TSizes.xs.horizontalSpace,
                  Text('Click here to see customer location', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12))
                  // lat != null && lng != null ? FutureBuilder<String>(
                  //   future: THelperFunctions.getPlaceName(lat, lng),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Text('Waiting', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12));
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12));
                  //     } else {
                  //       return Text(
                  //         snapshot.data ?? 'Unknown',
                  //         style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12),
                  //       );
                  //     }
                  //   },
                  // ) : Text('Unknown', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
