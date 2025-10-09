import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';

class LoginForgetPassword extends StatelessWidget {
  const LoginForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Forgot password?',
        style: AppTextStyle.we400Si15ColGrey.copyWith(
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
