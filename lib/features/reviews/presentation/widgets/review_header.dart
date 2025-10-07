import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/assets.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/core/helper/spacing.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigation.pop(context);
          },
          child: SvgPicture.asset(Assets.imagesSvgBackIcon),
        ),
        horizontalSpace(92),
        Text('Review', style: AppTextStyle.we600Si28ColText),
      ],
    );
  }
}
