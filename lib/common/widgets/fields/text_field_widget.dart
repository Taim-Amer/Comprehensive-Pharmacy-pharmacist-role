import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.title,
    required this.hint,
    this.icon,
    this.hintColor = TColors.grey,
    this.titleColor = const Color(0xFF6D6E72),
    this.hintSize,
    this.radius,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.phone,
  });

  final String? title;
  final String hint;
  final IconData? icon;
  final Color? hintColor;
  final Color? titleColor;
  final double? hintSize;
  final double? radius;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: TColors.buttonPrimary),
                8.horizontalSpace,
              ],
              if (title != null) Flexible(
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: titleColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        12.verticalSpace,
        radius != null ? Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: hintColor, fontSize: hintSize),
              filled: true,
              fillColor: TColors.lightGrey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          child: TextFormField(
            // textAlign: TextAlign.end,
            controller: controller,
            enableInteractiveSelection: false,
            validator: validator ?? (value) => null,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            ),
            cursorColor: TColors.buttonPrimary,
            keyboardType: keyboardType,
          ),
        ) : TextFormField(
          controller: controller,
          validator: validator ?? (value) => null,
          enableInteractiveSelection: false,
          // textAlign: TextAlign.end,
          decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: hintColor),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                cursorColor: TColors.buttonPrimary,
                keyboardType: keyboardType,
              ),
      ],
    );
  }
}
