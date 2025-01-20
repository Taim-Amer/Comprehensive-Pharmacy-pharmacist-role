import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/loading_widget.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/forget_password_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneVerifyButton extends StatelessWidget {
  const PhoneVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ForgetPasswordController.instance.forgetPasswordApiStatus.value == RequestState.loading ? const Center(child: LoadingWidget()): SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          TDeviceUtils.hideKeyboard(context);
          ForgetPasswordController.instance.forgetPassword();
        },
        child: Text(TranslationKey.kTcontinue),
      ),
    ));
  }
}
