import 'package:comprehensive_pharmacy_pharmacy_role/common/screens/common_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      image: TImages.noConnection,
      title: TEnglishTexts.noInternetTitle,
      subTitle: TEnglishTexts.noInternetSubTitle,
      showButton: true,
      buttonString: TEnglishTexts.retry,
      function: () => Get.back(),
    );
  }
}
