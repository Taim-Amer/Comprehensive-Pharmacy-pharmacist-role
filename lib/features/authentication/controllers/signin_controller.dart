import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/repositories/signin/signin_repo_impl.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/logging/logger.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SigninController extends GetxController{
  static SigninController get instance => Get.find();

  RxString countryCode = "+963".obs;

  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  Rx<RequestState> signinApiStatus = RequestState.begin.obs;

  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  Future<void> signin() async{
    THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.loading);
    if(!signinFormKey.currentState!.validate()){
      THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.begin);
      return;
    }

    await SigninRepoImpl.instance.signin(
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      // fcmToken: "fcmToken",
    ).then((response) {
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.success);
        showSnackBar(response.message ?? '', AlertState.success);
        TCacheHelper.saveData(key: 'token', value: response.data!.token);
        Get.offAllNamed(AppRoutes.order);
      } else{
        THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.error);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }
}