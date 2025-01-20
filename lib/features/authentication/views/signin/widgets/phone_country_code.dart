import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/models/country_model.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/storage/cache_helper.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:measure_size_builder/measure_size_builder.dart';

class PhoneCountryCode<T extends GetxController> extends StatefulWidget {
  final T controller;

  const PhoneCountryCode({
    super.key,
    required this.controller,
  });

  @override
  State<PhoneCountryCode<T>> createState() => _PhoneCountryCodeState<T>();
}

class _PhoneCountryCodeState<T extends GetxController> extends State<PhoneCountryCode<T>> {
  double height = 0;
  bool isExpanded = false;

  List<GlobalModel> countries = [
    GlobalModel(code: "+963", title: "سوريا", svg: TImages.jordan),
    GlobalModel(code: "+966", title: "السعودية", svg: TImages.saudi),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: dark ? TColors.dark : TColors.lightGrey,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Obx(() {
                final selectedCountry = countries.firstWhere(
                      (country) => (widget.controller as dynamic).countryCode.value == country.code,
                  orElse: () => countries.first,
                );
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    10.horizontalSpace,
                    const Icon(Iconsax.mobile, size: 20, color: Color(0xFF707070)),
                    8.horizontalSpace,
                    Container(height: 20.h, width: 1, color: dark ? TColors.lightGrey : Colors.black),
                    8.horizontalSpace,
                    Image.asset(selectedCountry.svg!, height: 24.h, width: 24.w),
                    8.horizontalSpace,
                    Text('(${selectedCountry.code})'),
                    8.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        // validator: (value) => TValidator.validatePhoneNumber(value),
                        enableInteractiveSelection: false,
                        controller: (widget.controller as dynamic).phoneController,
                        decoration: InputDecoration(
                          hintText: TEnglishTexts.phoneNumber,
                          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: const Color(0xFF707070),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                          border: InputBorder.none,
                        ),
                        cursorColor: TColors.buttonPrimary,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          final phoneController = (widget.controller as dynamic).phoneController;
                          if (!value.startsWith(selectedCountry.code as Pattern)) {
                            phoneController.text = selectedCountry.code! + value;
                            phoneController.selection = TextSelection.fromPosition(
                              TextPosition(offset: phoneController.text.length),
                            );
                          }
                        },
                      ),
                    ),
                    16.horizontalSpace,
                    Icon(Icons.keyboard_arrow_down,
                        color: dark ? TColors.lightGrey : const Color(0xFF707070), size: 22),
                    10.horizontalSpace,
                  ],
                );
              }),
            ),
          ),
        ),
        16.verticalSpace,
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? height : 0,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: dark ? TColors.dark : TColors.lightGrey,
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return MeasureSizeBuilder(
                builder: (context, size) {
                  height = (size.height + 10.w) * countries.length;
                  return countryCodeItemBuilder(index);
                },
              );
            },
          ),
        ),
        isExpanded ? TSizes.spaceBtwInputField.verticalSpace : const SizedBox(),
      ],
    );
  }

  Widget countryCodeItemBuilder(int index) {
    final country = countries[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          (widget.controller as dynamic).countryCode.value = country.code!;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            16.horizontalSpace,
            Image.asset(country.svg!, height: 24.h, width: 24.w),
            16.horizontalSpace,
            Text(country.title),
            8.horizontalSpace,
            Text('(${country.code})', textDirection: TextDirection.ltr),
            const Spacer(),
            Radio<String>(
              value: country.code!,
              groupValue: (widget.controller as dynamic).countryCode.value,
              activeColor: TColors.buttonPrimary,
              onChanged: (value) {
                setState(() {
                  (widget.controller as dynamic).countryCode.value = value!;
                  isExpanded = false;
                  TCacheHelper.saveData(key: "code", value: value);
                });
              },
            ),
            8.horizontalSpace,
          ],
        ),
      ),
    );
  }
}

