import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/logging/logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:location/location.dart';

class THelperFunctions {

  static viewNotification(RemoteMessage message) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (message.notification != null) {
      Get.snackbar(
        message.notification!.title ?? "No Title",
        message.notification!.body ?? "No Body",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.8),
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 3),
      );
    } else {
      TLoggerHelper.info('No notification data in message');
    }
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxLength){
    if(text.length < maxLength) {
      return text;
    }else{
      return '${text.substring(0, maxLength)} ....';
    }
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(BuildContext? context){
    return MediaQuery.of(context ?? Get.context!).size.height;
  }

  static double screenWidth(BuildContext? context){
    return MediaQuery.of(context ?? Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }

  static void updateApiStatus({required Rx<RequestState> target, required RequestState value}){
    target.value = value;
  }

  // Future<String> getPlaceName(double lat, double lng) async {
  //   List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
  //
  //   if (placemarks.isNotEmpty) {
  //     return placemarks.first.name ?? '';
  //   }
  //   return 'Unknown Place';
  // }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize){
    final wrappedList = <Widget>[];
    for(var i=0 ; i<widgets.length ; i+=rowSize){
      final rowChildren = widgets.sublist(i, i+rowSize > widgets.length ? widgets.length : i+rowSize);
      wrappedList.add(Row(children: rowChildren,));
    }
    return wrappedList;
  }
}
