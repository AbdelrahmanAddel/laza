import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By connecting your account confirm that you agree with our ',
            style: AppTextStyle.we400Si15ColGrey.copyWith(fontSize: 13),
          ),
          TextSpan(
            text: 'Term and Condition',
            style: AppTextStyle.we500Si13CollightGrey.copyWith(
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
