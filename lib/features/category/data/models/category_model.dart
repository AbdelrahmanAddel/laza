
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';


@JsonSerializable()
class CategoryModel {
  String? id;
  String? name;
  String? description;
  String? coverPictureUrl;

  CategoryModel({this.id, this.name, this.description, this.coverPictureUrl});
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@JsonSerializable()
class CategoriesResponse {
  List<CategoryModel>? categories;

  CategoriesResponse({this.categories});
  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}
