import 'package:comprehensive_pharmacy_pharmacy_role/app.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await TCacheHelper.init();

  runApp(const pharmacyApp());
}