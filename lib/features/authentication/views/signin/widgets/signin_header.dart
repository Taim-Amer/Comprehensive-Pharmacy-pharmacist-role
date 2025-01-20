import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninHeader extends StatelessWidget {
  const SigninHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: TRoundedContainer(
            width: 108.w,
            height: 108.h,
            backgroundColor: TColors.borderPrimary,
            radius: 24.r,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SvgPicture.asset(TImages.camera1),
            ),
          ),
        ),
        TSizes.spaceBtwSections.verticalSpace,
        Text(TEnglishTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        TSizes.sm.verticalSpace,
        Text(TEnglishTexts.loginSubTitle, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
