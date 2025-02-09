import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsSaveButton extends StatelessWidget {
  const SettingsSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: (){},
        child: Text(TranslationKey.kSave),
      ),
    );
  }
}
