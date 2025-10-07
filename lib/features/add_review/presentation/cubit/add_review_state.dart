import 'package:laza/features/add_review/domain/entities/add_review_entity.dart';

sealed class AddReviewState {}

class AddReviewInitial extends AddReviewState {}

class LoadingToAddReview extends AddReviewState {}

class ReviewAdded extends AddReviewState {
  final AddReviewResponse response;
  ReviewAdded({required this.response});
}

class ErrorToAddReview extends AddReviewState {
  final String message;
  ErrorToAddReview({required this.message});
}
