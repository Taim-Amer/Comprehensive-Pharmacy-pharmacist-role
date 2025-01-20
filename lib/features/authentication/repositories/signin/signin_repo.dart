import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/models/signin_model.dart';

abstract class SigninRepo{
  Future<SigninModel> signin({
    required String phone,
    required String password,
    // required String fcmToken,
  });
}