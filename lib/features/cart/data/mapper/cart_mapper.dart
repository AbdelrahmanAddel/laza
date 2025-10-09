import 'package:laza/features/cart/data/models/cart_model.dart';
import 'package:laza/features/cart/domain/entities/cart_entity.dart';

class CartMapper {
  static Cart toEntity(CartModel model) {
    return Cart(
      cartItems: model.cartItems.map((item) => _toCartItemEntity(item)).toList(),
    );
  }

  static CartItem _toCartItemEntity(CartItemModel model) {
    return CartItem(
      itemId: model.itemId,
      productId: model.productId,
      productName: model.productName,
      productCoverUrl: model.productCoverUrl,
      productStock: model.productStock,
      weightInGrams: model.weightInGrams,
      quantity: model.quantity,
      discountPercentage: model.discountPercentage,
      basePricePerUnit: model.basePricePerUnit,
      finalPricePerUnit: model.finalPricePerUnit,
      totalPrice: model.totalPrice,
    );
  }
}
