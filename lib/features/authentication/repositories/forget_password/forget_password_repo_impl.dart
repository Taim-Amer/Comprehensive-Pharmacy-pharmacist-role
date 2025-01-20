import 'package:comprehensive_pharmacy_client_role/features/authentication/models/forget_password_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/models/forget_verify_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/models/resend_otp_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/models/reset_password_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/forget_password/forget_password_repo.dart';
import 'package:comprehensive_pharmacy_client_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo{
  static ForgetPasswordRepoImpl get instance => Get.find<ForgetPasswordRepoImpl>();

  @override
  Future<ForgetPasswordModel> forgetPassword({required String phone}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.forget, {
      'phone' : phone,
    }).then((response) => ForgetPasswordModel.fromJson(response));
  }

  @override
  Future<ResetPasswordModel> newPassword({required String phone, required String password, required String passwordConfirm}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.forgetReset, {
      'phone' : phone,
      'password' : password,
      'password_confirmation' : passwordConfirm
    }).then((response) => ResetPasswordModel.fromJson(response));
  }

  @override
  Future<ForgetVerifyModel> passwordVerify({required String phone, required String otp}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.forgetVerify, {
      'phone' : phone,
      'otp' : otp,
    }).then((response) => ForgetVerifyModel.fromJson(response));
  }

  @override
  Future<ResendOtpModel> resendOtp({required String phone}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.resend, {
      'phone' : phone
    }).then((response) => ResendOtpModel.fromJson(response));
  }
}