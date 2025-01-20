import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/repositories/signup/signup_repo_impl.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/logging/logger.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  RxString countryCode = "+963".obs;

  Rx<RequestState> signupApiStatus = RequestState.begin.obs;

  final pharmacistNameController = TextEditingController();
  final pharmacyNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async{
    THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.loading);
    if(!signupFormKey.currentState!.validate()){
      THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.begin);
      return;
    }
    await SignupRepoImpl.instance.signup(
      name: pharmacistNameController.text,
      pharmacyName: pharmacyNameController.text,
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      passwordConfirm: confirmPasswordController.text.trim(),
      lat: 30.7333,
      lng: 30.7333,
      fcmToken: "fcmToken",
    ).then((response) async{
      if(response.status == true){
        await TCacheHelper.saveData(key: 'phone', value: response.user?.phone.toString() ?? '');
        showSnackBar(response.message ?? "", AlertState.success);
        THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.success);
        Get.toNamed(AppRoutes.otp);
      } else{
        showSnackBar(response.message ?? "", AlertState.error);
        THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.error);
      }
    }).catchError((error){
      TLoggerHelper.info(error.toString());
      THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> resend() async{
    await SignupRepoImpl.instance.resendOtp(phone: TCacheHelper.getData(key: 'phone')).then((response){
      if(response.status == true){
        showSnackBar(response.message ?? "", AlertState.success);
      }
    });
  }
}