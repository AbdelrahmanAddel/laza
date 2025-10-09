// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequestModel _$AddToCartRequestModelFromJson(
  Map<String, dynamic> json,
) => AddToCartRequestModel(
  productId: json['productId'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$AddToCartRequestModelToJson(
  AddToCartRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'quantity': instance.quantity,
};
