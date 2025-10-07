import 'package:json_annotation/json_annotation.dart';

part 'add_review_model.g.dart';

@JsonSerializable()
class AddReviewRequestModel {
  final String productId;
  final String comment;
  final int rating;

  AddReviewRequestModel({
    required this.productId,
    required this.comment,
    required this.rating,
  });

  Map<String, dynamic> toJson() => _$AddReviewRequestModelToJson(this);
}

@JsonSerializable()
class AddReviewResponseModel {
  final String? message;

  AddReviewResponseModel({
    this.message,
  });

  factory AddReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddReviewResponseModelFromJson(json);
}
