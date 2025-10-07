class Review {
  final String? comment;
  final int? rating;
  final String? createdAt;
  final String? userName;
  final String? userPicture;

  Review({
    required this.comment,
    required this.rating,
    required this.createdAt,
    required this.userName,
    required this.userPicture,
  });
}

class ReviewsData {
  final List<Review>? items;
  final int? page;
  final int? pageSize;
  final int? totalCount;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  ReviewsData({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });
}

class ReviewsResponse {
  final String? message;
  final double? averageRating;
  final int? reviewsCount;
  final ReviewsData? reviews;

  ReviewsResponse({
    required this.message,
    required this.averageRating,
    required this.reviewsCount,
    required this.reviews,
  });
}
