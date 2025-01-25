import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TEmptyForm extends StatelessWidget {
  const TEmptyForm({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            TSizes.spaceBtwItems.verticalSpace,
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            TSizes.sm.verticalSpace,
            Text(subTitle, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
