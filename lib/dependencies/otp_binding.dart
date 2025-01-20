import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/otp_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/signup/otp_repo_impl.dart';
import 'package:get/get.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<OtpController>(OtpController());
    Get.put<OtpRepoImpl>(OtpRepoImpl());
  }
}