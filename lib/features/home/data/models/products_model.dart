import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductResponse {
  final List<Item>? items;
  final int? page;
  final int? pageSize;
  final int? totalCount;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  ProductResponse({
    required this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@JsonSerializable()
class Item {
  final String? id;
  final String? productCode;
  final String? name;
  final String? description;
  final String? arabicName;
  final String? arabicDescription;
  final String? coverPictureUrl;
  final List<String>? productPictures;
  final double? price;
  final int? stock;
  final double? weight;
  final String? color;
  final double? rating;
  final int? reviewsCount;
  final double? discountPercentage;
  final String? sellerId;
  final List<String>? categories;

  Item({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
    required this.discountPercentage,
    required this.sellerId,
    required this.categories,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
