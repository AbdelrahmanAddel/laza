import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/review_item.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/details/presentation/widgets/custom_text_row.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';
import 'package:laza/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:laza/features/reviews/presentation/cubit/review_state.dart';
import 'package:laza/features/reviews/presentation/screens/reviews_screen.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReviewCubit>()..getReviews(product.id ?? ''),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextRow(
            firstText: 'Reviews',
            secondText: 'See All',
            onTapSecondText: () {
              Navigation.push(
                ReviewsScreen(productId: product.id ?? ''),
                context,
              );
            },
          ),
          verticalSpace(15),
          BlocBuilder<ReviewCubit, ReviewState>(
            builder: (context, state) {
              switch (state) {
                case LoadingToLoadReviews():
                  return const Center(child: CircularProgressIndicator());
                case ReviewsLoaded():
                  return ReviewItem(
                    review: state.reviewsResponse?.reviews?.items?[0],
                  );
                case ErrorToLoadReviews():
                  return const Center(child: Text('SomeThing Wen\'t Wrong'));
                default:
                  return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
