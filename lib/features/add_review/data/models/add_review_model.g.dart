// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewRequestModel _$AddReviewRequestModelFromJson(
  Map<String, dynamic> json,
) => AddReviewRequestModel(
  productId: json['productId'] as String,
  comment: json['comment'] as String,
  rating: (json['rating'] as num).toInt(),
);

Map<String, dynamic> _$AddReviewRequestModelToJson(
  AddReviewRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'comment': instance.comment,
  'rating': instance.rating,
};

AddReviewResponseModel _$AddReviewResponseModelFromJson(
  Map<String, dynamic> json,
) => AddReviewResponseModel(message: json['message'] as String?);

Map<String, dynamic> _$AddReviewResponseModelToJson(
  AddReviewResponseModel instance,
) => <String, dynamic>{'message': instance.message};
