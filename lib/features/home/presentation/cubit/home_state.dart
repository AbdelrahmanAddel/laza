import 'package:laza/features/home/domain/entities/product_entity.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingToLoadHomeProduct extends HomeState {}

final class HomeProductsLoaded extends HomeState {
  final List<Product>? products;

  HomeProductsLoaded({required this.products});
}

final class ErrorToLoadHomeProduct extends HomeState {
  final String message;

  ErrorToLoadHomeProduct({required this.message});
}
