import 'package:comprehensive_pharmacy_pharmacy_role/app.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/personalization/views/settings/settings_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () => Get.to(const SettingsScreen()),
        child: Text(TEnglishTexts.save),
      ),
    );
  }
}
