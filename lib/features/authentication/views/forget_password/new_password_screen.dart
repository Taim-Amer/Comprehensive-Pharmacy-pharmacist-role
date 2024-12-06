import 'package:comprehensive_pharmacy_pharmacy_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/widgets/new_password_form.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/widgets/new_password_header.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/views/forget_password/widgets/update_password_button.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/exports.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: BackIcon()),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const NewPasswordHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              const NewPasswordForm(),
              TSizes.spaceBtwSections.verticalSpace,
              const UpdatePasswordButton()
            ],
          ),
        ),
      ),
    );
  }
}
