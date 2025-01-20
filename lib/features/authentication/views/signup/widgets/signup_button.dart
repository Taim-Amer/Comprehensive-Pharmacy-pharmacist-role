import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/loading_widget.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/signup_controller.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SignupController.instance.signupApiStatus.value == RequestState.loading ? const Center(child: LoadingWidget()): SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          TDeviceUtils.hideKeyboard(context);
          SignupController.instance.signup();
        },
        child: Text(TranslationKey.kRegister),
      ),
    ));
  }
}
