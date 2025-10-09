import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
    required this.firstText,
    required this.secondText,
    this.onTapSecondText,
  });
  final String firstText;
  final String secondText;
  final Function()? onTapSecondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(firstText, style: AppTextStyle.we500Si17ColText),
        GestureDetector(
          onTap: onTapSecondText,
          child: Text(secondText, style: AppTextStyle.we400Si15ColGrey),
        ),
      ],
    );
  }
}
