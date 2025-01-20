import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/repositories/signup/otp_repo_impl.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/logging/logger.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  static OtpController get instance => Get.find();

  Rx<RequestState> verifyApiStatus = RequestState.begin.obs;
  final otpController = TextEditingController();

  Future<void> verify() async{
    THelperFunctions.updateApiStatus(target: verifyApiStatus, value: RequestState.loading);
    String? phone = TCacheHelper.getData(key: 'phone');
    await OtpRepoImpl.instance.verifyCode(
      phone: phone!,
      otp: otpController.text.trim(),
    ).then((response) {
      if(response.status == true){
        TCacheHelper.saveData(key: 'token', value: response.token);
        Get.offAllNamed(AppRoutes.order);
        showSnackBar(response.message ?? "", AlertState.success);
        THelperFunctions.updateApiStatus(target: verifyApiStatus, value: RequestState.success);
      }else{
        showSnackBar(response.message ?? "", AlertState.error);
        THelperFunctions.updateApiStatus(target: verifyApiStatus, value: RequestState.error);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: verifyApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

}