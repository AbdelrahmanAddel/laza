import 'package:flutter/material.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/reviews/domain/entities/review_entity.dart';
import 'package:laza/features/reviews/presentation/widgets/review_details.dart';
import 'package:laza/features/reviews/presentation/widgets/review_header.dart';
import 'package:laza/features/reviews/presentation/widgets/review_list.dart';

class ReviewScreenBody extends StatelessWidget {
  const ReviewScreenBody({super.key, required this.review, required this.productId});
  final ReviewsResponse? review;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              ReviewHeader(),
              verticalSpace(38),
              ReviewDetails(review: review, productId: productId),

              SizedBox(height: 30),
              ReviewList(reviews: review?.reviews?.items),
            ],
          ),
        ),
      ),
    );
  }
}
