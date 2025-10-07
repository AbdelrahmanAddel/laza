import 'package:flutter/material.dart';
import 'package:laza/core/common/widgets/review_item.dart';
import 'package:laza/features/reviews/domain/entities/review_entity.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key, required this.reviews});
  final List<Review>? reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews?.length,

      itemBuilder: (context, index) {
        return ReviewItem(review: reviews?[index]);
      },
    );
  }
}
