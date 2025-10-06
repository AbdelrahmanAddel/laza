import 'package:laza/features/home/domain/entities/product_entity.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Product>? products;

  HomeSuccess({required this.products});
}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
