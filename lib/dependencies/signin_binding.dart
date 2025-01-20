import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/signin_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/signin/signin_repo_impl.dart';
import 'package:get/get.dart';

class SigninBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SigninController>(SigninController());
    Get.put<SigninRepoImpl>(SigninRepoImpl());
  }
}