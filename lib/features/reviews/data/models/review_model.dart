import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  String? comment;
  int? rating;
  String? createdAt;
  String? userName;
  String? userPicture;

  ReviewModel({
    this.comment,
    this.rating,
    this.createdAt,
    this.userName,
    this.userPicture,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

@JsonSerializable()
class ReviewsDataModel {
  List<ReviewModel>? items;
  int? page;
  int? pageSize;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  ReviewsDataModel({
    this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory ReviewsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsDataModelFromJson(json);
}

@JsonSerializable()
class ReviewsResponseModel {
  String? message;
  double? averageRating;
  int? reviewsCount;
  ReviewsDataModel? reviews;

  ReviewsResponseModel({
    this.message,
    this.averageRating,
    this.reviewsCount,
    this.reviews,
  });

  factory ReviewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseModelFromJson(json);
}
