import 'package:laza/features/category/domain/entities/category_entity.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class LoadingToLoadCategories extends CategoryState {}

final class CategoriesLoaded extends CategoryState {
  final List<Category>? categories;

  CategoriesLoaded({required this.categories});
}

final class ErrorToLoadCategories extends CategoryState {
  final String message;

  ErrorToLoadCategories({required this.message});
}
