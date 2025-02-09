import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/widgets/drawer_header.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/views/settings/settings_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GeneralDrawer extends StatelessWidget {
  const   GeneralDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(TSizes.sm),
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(TSizes.md),
            child: TDrawerHeader(),
          ),
          TSettingMenuTile(icon: Iconsax.home, title: TranslationKey.kHome,),
          TRoundedContainer(
            height: 1,
            backgroundColor: dark ? TColors.black : const Color(0xFFF3F3F3),
          ),
          TSettingMenuTile(icon: Iconsax.task, title: TranslationKey.kMyOrders,),
          TRoundedContainer(
            height: 1,
            backgroundColor: dark ? TColors.black : const Color(0xFFF3F3F3),
          ),
          TSettingMenuTile(
            icon: Iconsax.language_circle,
            title: TranslationKey.kLanguages,
            onTap: () => Get.to(() => const SettingsScreen()),
          ),
          TRoundedContainer(
            height: 1,
            backgroundColor: dark ? TColors.black : const Color(0xFFF3F3F3),
          ),
          TSettingMenuTile(icon: Iconsax.information, title: TranslationKey.kPrivacyPolicy,),
          TRoundedContainer(
            height: 1,
            backgroundColor: dark ? TColors.black : const Color(0xFFF3F3F3),
          ),
          TSettingMenuTile(icon: Iconsax.message_question, title: TranslationKey.kAbout,),
          TRoundedContainer(
            height: 1,
            backgroundColor: dark ? TColors.black : const Color(0xFFF3F3F3),
          ),
          TSettingMenuTile(icon: Iconsax.login, title: TranslationKey.kSignOut,),
        ],
      ),
    );
  }
}
