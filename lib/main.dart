import 'package:comprehensive_pharmacy_pharmacy_role/app.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Get.testMode = true;

  await TCacheHelper.init();

  runApp(const PharmacyApp());
}