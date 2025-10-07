import 'package:laza/features/add_review/data/models/add_review_model.dart';
import 'package:laza/features/add_review/domain/entities/add_review_entity.dart';

class AddReviewMapper {
  static AddReviewResponseModel toModel(AddReviewRequest request) {
    return AddReviewResponseModel(
      message: null,
    );
  }

  static AddReviewRequestModel toRequestModel(AddReviewRequest request) {
    return AddReviewRequestModel(
      productId: request.productId,
      comment: request.comment,
      rating: request.rating,
    );
  }

  static AddReviewResponse toEntity(AddReviewResponseModel? response) {
    if (response == null) {
      return AddReviewResponse(
        message: null,
      );
    }

    return AddReviewResponse(
      message: response.message,
    );
  }
}
