import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/loading_widget.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/otp_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/signup_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpButton extends StatelessWidget {
  const OtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => OtpController.instance.verifyApiStatus.value == RequestState.loading ? const Center(child: LoadingWidget()) : SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () => OtpController.instance.verify(),
        child: Text(TranslationKey.kVerifyCode),
      ),
    ));
  }
}
