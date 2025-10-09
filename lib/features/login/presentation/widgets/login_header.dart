import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/helper/spacing.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Welcome', style: AppTextStyle.we600Si28ColText),
          verticalSpace(5),
          Text(
            'Please enter your data to continue',
            style: AppTextStyle.we400Si15ColGrey,
          ),
        ],
      ),
    );
  }
}
