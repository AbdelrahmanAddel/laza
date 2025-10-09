import 'package:laza/features/cart/domain/entities/cart_entity.dart';

abstract interface class CartRepository {
  Future<void> addToCart(String productId, int quantity);
  Future<Cart> getCart();
}
