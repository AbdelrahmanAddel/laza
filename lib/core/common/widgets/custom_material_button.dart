import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 75.h,
      minWidth: double.infinity,
      color: AppColors.primaryColor,
      onPressed: onPressed ?? () {},
      child: Text(
        text,
        style: AppTextStyle.we500Si17ColText.copyWith(
          color: AppColors.lightGrey,
        ),
      ),
    );
  }
}
