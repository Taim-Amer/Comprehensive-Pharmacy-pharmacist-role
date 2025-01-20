import 'package:comprehensive_pharmacy_client_role/features/authentication/models/forget_password_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/models/forget_verify_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/models/resend_otp_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/models/reset_password_model.dart';

abstract class ForgetPasswordRepo{
  Future<ForgetPasswordModel> forgetPassword({required String phone});
  Future<ForgetVerifyModel> passwordVerify({required String phone, required String otp});
  Future<ResetPasswordModel> newPassword({required String phone, required String password, required String passwordConfirm});
  Future<ResendOtpModel> resendOtp({required String phone});
}