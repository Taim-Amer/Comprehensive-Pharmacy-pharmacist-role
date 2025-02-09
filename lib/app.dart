import 'package:comprehensive_pharmacy_pharmacy_role/dependencies/signin_binding.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/controllers/settings_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/translations.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SettingsController>(SettingsController());

    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: AppRoutes.signin,
        getPages: AppRoutes.routes,
        translations: TAppTranslations(),
        locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        // home: LocationMap()
        initialBinding: SigninBinding(),
        // home: const LocationMap(),
        // home: SigninScreen(),
      ),
    );
  }
}