import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/signup_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/signup/signup_repo_impl.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
    Get.put<SignupRepoImpl>(SignupRepoImpl());
  }
}