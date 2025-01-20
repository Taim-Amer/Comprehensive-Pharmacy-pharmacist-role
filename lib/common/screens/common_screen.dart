import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key, required this.image, required this.title, required this.subTitle, required this.showButton, required this.buttonString, this.function});

  final String image;
  final String title;
  final String subTitle;
  final bool showButton;
  final String buttonString;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18)),
            TSizes.sm.verticalSpace,
            Text(subTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: const Color(0xFF989898))),
            TSizes.spaceBtwItems.verticalSpace,
            showButton ? SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: function ?? (){},
                child: Text(buttonString),
              ),
            ) : const SizedBox()
          ],
        ),
      ),
    );
  }
}
