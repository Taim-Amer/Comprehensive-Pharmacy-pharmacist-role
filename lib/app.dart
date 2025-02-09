import 'package:comprehensive_pharmacy_pharmacy_role/dependencies/general_binding.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/controllers/settings_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/translations.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SettingsController>(SettingsController());
    String? token = TCacheHelper.getData(key: "token");
    String initialRoute = token != null ? AppRoutes.order : AppRoutes.signin;
    String? language = TCacheHelper.getData(key: "locale");
    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.system,
        themeMode: SettingsController.instance.themeMode.value,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: initialRoute,
        getPages: AppRoutes.routes,
        translations: TAppTranslations(),
        locale: Locale(language ?? 'en'),
        fallbackLocale: const Locale('en'),
        initialBinding: GeneralBindings(),
        // home: const LocationMap(),
        // home: SigninScreen(),
      ),
    );
  }
}