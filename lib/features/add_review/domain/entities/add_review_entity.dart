class AddReviewRequest {
  final String productId;
  final String comment;
  final int rating;

  AddReviewRequest({
    required this.productId,
    required this.comment,
    required this.rating,
  });
}

class AddReviewResponse {
  final String? message;

  AddReviewResponse({
    required this.message,
  });
}
