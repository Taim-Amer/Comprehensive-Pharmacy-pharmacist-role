import 'package:comprehensive_pharmacy_client_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/widgets/signin_button.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/widgets/signin_footer.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/widgets/signin_form.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/widgets/signin_header.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SigninHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              const SigninForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child: Text(TEnglishTexts.forgetPassword))
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              const SigninButton(),
              TSizes.spaceBtwSections.verticalSpace,
              const SigninFooter()
            ],
          ),
        ),
      ),
    );
  }
}
