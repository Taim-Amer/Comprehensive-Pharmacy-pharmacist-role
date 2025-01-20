import 'package:comprehensive_pharmacy_pharmacy_role/features/notifications/views/notifications_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GeneralAppbar extends StatelessWidget {
  const GeneralAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(Icons.more_vert, color: dark ? TColors.light : const Color(0xFF383838)),
        ),
        Text('pharmacy App', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: dark ? TColors.light : const Color(0xFF383838))),
        IconButton(
          onPressed: () => Get.to(const NotificationsScreen()),
          icon: Icon(Iconsax.notification, color: dark ? TColors.light : const Color(0xFF383838)),)
      ],
    );
  }
}
