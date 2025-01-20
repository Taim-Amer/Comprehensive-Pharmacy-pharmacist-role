import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/models/code_verification_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/models/resend_otp_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/models/signup_model.dart';

abstract class SignupRepo {
  Future<SignupModel> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required double lat,
    required double lng,
    required String fcmToken
  });

  Future<ResendOtpModel> resendOtp({required String phone});
}
