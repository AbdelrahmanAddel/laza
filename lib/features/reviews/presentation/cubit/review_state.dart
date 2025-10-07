import 'package:laza/features/reviews/domain/entities/review_entity.dart';

sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class LoadingToLoadReviews extends ReviewState {}

final class ReviewsLoaded extends ReviewState {
  final ReviewsResponse? reviewsResponse;

  ReviewsLoaded({required this.reviewsResponse});
}

final class ErrorToLoadReviews extends ReviewState {
  final String message;

  ErrorToLoadReviews({required this.message});
}
