import 'package:laza/features/reviews/domain/entities/review_entity.dart';

abstract interface class ReviewRepository {
  Future<ReviewsResponse>? getReviews(String productId);
}
