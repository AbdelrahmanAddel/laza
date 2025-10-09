import 'package:laza/features/cart/domain/entities/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartFailure extends CartState {
  final String message;

  AddToCartFailure({required this.message});
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {
  final Cart cart;

  GetCartSuccess({required this.cart});
}

class GetCartFailure extends CartState {
  final String message;

  GetCartFailure({required this.message});
}
