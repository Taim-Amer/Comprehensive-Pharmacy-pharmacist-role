// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:taha_debts/utils/popups/loaders.dart';
//
// class NetworkManager extends GetxController {
//   static NetworkManager get instance => Get.find();
//
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Subscribe to connectivity changes
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
//       _updateConnectionStatus(result); // Pass a single ConnectivityResult
//     });
//   }
//
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectivityStatus.value = result;
//     if (_connectivityStatus.value == ConnectivityResult.none) {
//       TLoaders.warningSnackBar(title: "No Internet Connection");
//     }
//   }
//
//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       return result != ConnectivityResult.none;
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     _connectivitySubscription.cancel();
//   }
// }
