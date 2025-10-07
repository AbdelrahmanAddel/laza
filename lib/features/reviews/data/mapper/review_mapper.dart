import 'package:laza/features/reviews/data/models/review_model.dart';
import 'package:laza/features/reviews/domain/entities/review_entity.dart';

class ReviewMapper {
  static ReviewsResponse toEntity(ReviewsResponseModel? response) {
    if (response == null) {
      return ReviewsResponse(
        message: null,
        averageRating: null,
        reviewsCount: null,
        reviews: null,
      );
    }

    return ReviewsResponse(
      message: response.message,
      averageRating: response.averageRating,
      reviewsCount: response.reviewsCount,
      reviews: response.reviews != null
          ? ReviewsData(
              items: response.reviews!.items
                      ?.map((item) => Review(
                            comment: item.comment,
                            rating: item.rating,
                            createdAt: item.createdAt,
                            userName: item.userName,
                            userPicture: item.userPicture,
                          ))
                      .toList() ??
                  [],
              page: response.reviews!.page,
              pageSize: response.reviews!.pageSize,
              totalCount: response.reviews!.totalCount,
              hasNextPage: response.reviews!.hasNextPage,
              hasPreviousPage: response.reviews!.hasPreviousPage,
            )
          : null,
    );
  }
}
