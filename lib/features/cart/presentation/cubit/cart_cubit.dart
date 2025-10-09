import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/errors/exceptions.dart';
import 'package:laza/features/cart/domain/repositories/cart_repository.dart';
import 'package:laza/features/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;

  CartCubit({required this.cartRepository}) : super(CartInitial());

  Future<void> addToCart(String productId, int quantity) async {
    emit(AddToCartLoading());
    try {
      await cartRepository.addToCart(productId, quantity);
      emit(AddToCartSuccess());
    } on ServerException catch (error) {
      emit(AddToCartFailure(message: error.message));
    } catch (e) {
      emit(AddToCartFailure(message: e.toString()));
    }
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    try {
      final cart = await cartRepository.getCart();
      emit(GetCartSuccess(cart: cart));
    } on ServerException catch (error) {
      emit(GetCartFailure(message: error.message));
    } catch (e) {
      emit(GetCartFailure(message: e.toString()));
    }
  }
}
