import 'package:comprehensive_pharmacy_client_role/features/authentication/models/code_verification_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/signup/otp_repo.dart';
import 'package:comprehensive_pharmacy_client_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class OtpRepoImpl implements OtpRepo{
  static OtpRepoImpl get instance => Get.find();

  @override
  Future<CodeVerificationModel> verifyCode({required String phone, required String otp}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.verify, {
      'phone' : phone,
      'otp' : otp,
    }).then((response) => CodeVerificationModel.fromJson(response));
  }
}