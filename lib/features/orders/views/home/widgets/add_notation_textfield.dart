import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotationTextfield extends StatelessWidget {
  const AddNotationTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      height: 165.h,
      backgroundColor: dark ? TColors.dark : TColors.lightGrey,
      // showBorder: dark ? true : false,
      showBorder: false,
      child: TextFormField(
        cursorColor: TColors.primary,
        enableInteractiveSelection: false,
        maxLines: 7,
        // textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: TEnglishTexts.writeNote,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
