import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RejectOrderButton extends StatelessWidget {
  const RejectOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(TEnglishTexts.rejectOrder),
      ),
    );
  }
}
