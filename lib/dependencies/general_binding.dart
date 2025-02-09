import 'package:comprehensive_pharmacy_pharmacy_role/dependencies/order_binding.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/dependencies/signin_binding.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    final String? token = TCacheHelper.getData(key: 'token');
    if (token != null) {
      Get.offAllNamed(AppRoutes.home);
      Get.put<OrderBinding>(OrderBinding());
    } else {
      Get.offAllNamed(AppRoutes.signin);
      Get.put<SigninBinding>(SigninBinding());
    }
  }
}