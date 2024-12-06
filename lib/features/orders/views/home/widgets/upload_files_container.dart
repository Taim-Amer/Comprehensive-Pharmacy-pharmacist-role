import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:comprehensive_pharmacy_client_role/services/file_services.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/dotted_container.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';

class UploadFilesContainer extends StatelessWidget {
  const UploadFilesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return TDottedContainer(
      width: double.infinity,
      height: 195.h,
      borderColor: TColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(TImages.uploadIcon),
          TSizes.md.verticalSpace,
          Text(
            TEnglishTexts.uploadFile,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TSizes.sm.verticalSpace,
          Text(
            TEnglishTexts.supportedFiles,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12),
          ),
          TSizes.md.verticalSpace,
          SizedBox(
            child: ElevatedButton(
              onPressed: () => TFileServices.pickMultipleFiles(),
              child: Text(TEnglishTexts.browse),
            ),
          ),
        ],
      ),
    );
  }
}
