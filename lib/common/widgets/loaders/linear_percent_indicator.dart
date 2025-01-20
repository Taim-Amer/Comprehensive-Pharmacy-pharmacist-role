// import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/loading_widget.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/controllers/orders_controller.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/enums.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/services/file_services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/percent_indicator.dart';
//
// class TLinearPercentIndicator extends StatefulWidget {
//   const TLinearPercentIndicator({super.key, required this.fileName});
//
//   final String fileName;
//
//   @override
//   State<TLinearPercentIndicator> createState() => _TLinearPercentIndicatorState();
// }
//
// class _TLinearPercentIndicatorState extends State<TLinearPercentIndicator> {
//   double _progress = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _animateProgress();
//   }
//
//   void _animateProgress() {
//     Future.delayed(const Duration(milliseconds: 100), () {
//       setState(() {
//         _progress = (_progress + 0.1).clamp(0.0, 1.0);
//         if (_progress < 1.0) {
//           _animateProgress();
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return _progress != 1 ? CircularPercentIndicator(
//       radius: 10,
//       lineWidth: 3,
//       percent: _progress,
//       backgroundColor: dark ? TColors.dark : TColors.grey,
//       progressColor: TColors.primary,
//     ) : GestureDetector(
//         onTap: () => TFileServices.deleteFileByName(widget.fileName),
//         child: Obx(() => OrdersController.instance.createOrderApiStatus.value == RequestState.loading ? const Padding(
//           padding: EdgeInsets.all(TSizes.sm),
//           child: LoadingWidget(),
//         ) :SvgPicture.asset(TImages.trash)));
//   }
// }
