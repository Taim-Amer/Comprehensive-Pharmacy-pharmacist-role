import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/models/signin_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/repositories/signin/signin_repo.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class SigninRepoImpl implements SigninRepo{
  static SigninRepoImpl get instance => Get.find<SigninRepoImpl>();

  @override
  Future<SigninModel> signin({required String phone, required String password}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.signin, {
      'phone' : phone,
      'password' : password,
      // 'fcmToken' : fcmToken,
    }).then((response) => SigninModel.fromJson(response));
  }
}