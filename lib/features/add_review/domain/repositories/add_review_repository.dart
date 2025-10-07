import 'package:laza/features/add_review/domain/entities/add_review_entity.dart';

abstract interface class AddReviewRepository {
  Future<AddReviewResponse>? addReview(String userId, AddReviewRequest request);
}
