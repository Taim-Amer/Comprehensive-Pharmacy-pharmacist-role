import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TSpacingStyle {
  static EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight.h,
    left: TSizes.defaultSpace.w,
    bottom: TSizes.defaultSpace.w,
    right: TSizes.defaultSpace.w,
  );
}