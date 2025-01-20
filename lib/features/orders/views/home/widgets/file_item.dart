// import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/linear_percent_indicator.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
// import 'package:comprehensive_pharmacy_pharmacy_role/utils/services/file_services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class FileItem extends StatelessWidget {
//   const FileItem({super.key, required this.fileName});
//
//   final String fileName;
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return ValueListenableBuilder(
//       valueListenable: TFileServices.isSelected,
//       builder: (context, isSelected, child) => isSelected ? TRoundedContainer(
//         height: 40.h,
//         backgroundColor: dark ? TColors.dark : TColors.light,
//         radius: 4,
//         showBorder: isSelected == true ? true : false,
//         borderColor: TColors.primary,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(fileName, overflow: TextOverflow.ellipsis),
//               TLinearPercentIndicator(fileName: fileName),
//             ],
//           ),
//         ),
//       ) : const SizedBox(),
//     );
//   }
// }
