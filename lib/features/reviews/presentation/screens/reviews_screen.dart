import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:laza/features/reviews/presentation/cubit/review_state.dart';
import 'package:laza/features/reviews/presentation/widgets/review_screen_body.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ReviewCubit>()..getReviews(productId),
      child: Scaffold(
        body: BlocBuilder<ReviewCubit, ReviewState>(
          buildWhen: (previous, current) =>
              current is LoadingToLoadReviews ||
              current is ReviewsLoaded ||
              current is ErrorToLoadReviews,
          builder: (context, state) {
            switch (state) {
              case LoadingToLoadReviews():
                return const Center(child: CircularProgressIndicator());
              case ReviewsLoaded():
                return ReviewScreenBody(review: state.reviewsResponse, productId: productId);
              case ErrorToLoadReviews():
                return const Center(child: Text("Something went wrong"));
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
