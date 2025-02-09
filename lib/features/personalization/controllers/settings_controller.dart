
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  final ValueNotifier<Language?> selectedLanguageNotifier = ValueNotifier<Language?>(Language.english);

  Rx<Language> selectedLanguage = Language.english.obs;
  Rx<Locale> locale = const Locale("en").obs;
  var logoutApiStatus = RequestState.begin.obs;
  var themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    String? savedTheme = TCacheHelper.getData(key: "themeMode");
    if (savedTheme == "light") {
      themeMode.value = ThemeMode.light;
    } else if (savedTheme == "dark") {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.system;
    }
  }

  void updateThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    String themeString = mode == ThemeMode.light ? "light" : mode == ThemeMode.dark ? "dark" : "system";
    TCacheHelper.saveData(key: "themeMode", value: themeString);
  }

  void updateLogoutStatus({required RequestState value}) {
    logoutApiStatus.value = value;
  }

  void setSelectedRadio(Language language) {
    selectedLanguage.value = language;
    if (language == Language.arabic) {
      locale.value = const Locale('ar');
      TCacheHelper.saveData(key: "locale", value: "ar");
      Get.updateLocale(locale.value);
    } else if (language == Language.english) {
      locale.value = const Locale('en');
      TCacheHelper.saveData(key: "locale", value: "en");
      Get.updateLocale(locale.value);
    }
    selectedLanguageNotifier.value = language; // التأكد من تحديث ValueNotifier
  }
}
