import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/add_review/presentation/screens/add_review_screen.dart';
import 'package:laza/features/reviews/domain/entities/review_entity.dart';

class ReviewDetails extends StatelessWidget {
  const ReviewDetails({super.key, this.review, required this.productId});
  final ReviewsResponse? review;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${review?.reviews?.totalCount}'
              ' Reviews',
              style: AppTextStyle.we500Si17ColText,
            ),
            Text(review?.averageRating?.floor().toString() ?? ''),
          ],
        ),
        MaterialButton(
          minWidth: 114,
          height: 36,

          color: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          onPressed: () {
            Navigation.push(
              AddReviewScreen(
                productId: productId,
                userId: 'a363e552-19f5-45c3-9c1c-ab6fb61fa37c',
              ),
              context,
            );
          },
          child: Row(
            children: [
              Icon(Icons.edit, color: Colors.white),
              horizontalSpace(5),

              Text('Add Review', style: AppTextStyle.we500Si13CollightGrey),
            ],
          ),
        ),
      ],
    );
  }
}
