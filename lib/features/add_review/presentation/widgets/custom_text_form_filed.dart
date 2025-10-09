import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/common/form_field_validation.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/common/app_text_styles.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    required this.controller,
    required this.maxLines,
    required this.formFieldsType,
  });

  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final TextFormFieldsType formFieldsType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: textFormFieldValidator(formFieldsType),
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: AppColors.lightGrey,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.we400Si15ColGrey,
      ),
    );
  }
}
