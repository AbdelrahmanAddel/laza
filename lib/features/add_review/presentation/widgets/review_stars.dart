import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/add_review/presentation/controller/review_controllers.dart';

class ReviewStars extends StatefulWidget {
  const ReviewStars({super.key, required this.controller});
  final AddReviewController controller;

  @override
  State<ReviewStars> createState() => _ReviewStarsState();
}

class _ReviewStarsState extends State<ReviewStars> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Star', style: AppTextStyle.we500Si17ColText),
        verticalSpace(12),
        Row(
          children: [
            Text(
              '0',
              style: AppTextStyle.we500Si11ColPrimary.copyWith(
                color: AppColors.textColor,
              ),
            ),
            Expanded(
              child: Slider(
                min: 0,
                max: 5,
                value: widget.controller.rating,
                onChanged: (value) {
                  setState(() {
                    widget.controller.rating = value;
                  });
                },
              ),
            ),
            Text(
              '5.0',
              style: AppTextStyle.we500Si11ColPrimary.copyWith(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Text(
          widget.controller.rating.floor().toString(),
          style: AppTextStyle.we500Si17ColText,
        ),
      ],
    );
  }
}
