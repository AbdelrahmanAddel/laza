import 'package:flutter/material.dart';
import 'package:laza/core/common/widgets/read_more_widget.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/reviews/domain/entities/review_entity.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, this.review});
  final Review? review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(review?.userPicture ?? ''),
              radius: 25,
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(review?.userName ?? ''),
                Text(review?.createdAt?.substring(0, 10) ?? ''),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${review?.rating?.floor()} Rating'),
                Row(
                  children: [
                    ...List.generate(
                      review?.rating?.floor() ?? 0,
                      (index) =>
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                    if ((review?.rating ?? 0) -
                            (review?.rating?.floor() ?? 0) >=
                        0.5)
                      const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: 16,
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
        verticalSpace(10),
        ReadMoreWidget(text: review?.comment ?? ''),
      ],
    );
  }
}
