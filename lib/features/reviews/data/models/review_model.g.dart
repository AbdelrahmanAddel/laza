// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  comment: json['comment'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  userName: json['userName'] as String?,
  userPicture: json['userPicture'] as String?,
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'rating': instance.rating,
      'createdAt': instance.createdAt,
      'userName': instance.userName,
      'userPicture': instance.userPicture,
    };

ReviewsDataModel _$ReviewsDataModelFromJson(Map<String, dynamic> json) =>
    ReviewsDataModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      hasNextPage: json['hasNextPage'] as bool?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
    );

Map<String, dynamic> _$ReviewsDataModelToJson(ReviewsDataModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
    };

ReviewsResponseModel _$ReviewsResponseModelFromJson(
  Map<String, dynamic> json,
) => ReviewsResponseModel(
  message: json['message'] as String?,
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  reviewsCount: (json['reviewsCount'] as num?)?.toInt(),
  reviews: json['reviews'] == null
      ? null
      : ReviewsDataModel.fromJson(json['reviews'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReviewsResponseModelToJson(
  ReviewsResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'averageRating': instance.averageRating,
  'reviewsCount': instance.reviewsCount,
  'reviews': instance.reviews,
};
