import 'package:dio/dio.dart';
import 'package:laza/core/errors/handle_exception.dart';
import 'package:laza/features/cart/data/datasources/cart_api_service.dart';
import 'package:laza/features/cart/data/mapper/cart_mapper.dart';
import 'package:laza/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:laza/features/cart/domain/entities/cart_entity.dart';
import 'package:laza/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartApiService apiService;

  CartRepositoryImpl({required this.apiService});

  @override
  Future<void> addToCart(String productId, int quantity) async {
    try {
      await apiService.addToCart(AddToCartRequestModel(
        productId: productId,
        quantity: quantity,
      ));
    } on DioException catch (error) {
      HandleException.handle(error);
      rethrow;
    }
  }

  @override
  Future<Cart> getCart() async {
    try {
      final response = await apiService.getCart();
      return CartMapper.toEntity(response);
    } on DioException catch (error) {
      HandleException.handle(error);
      rethrow;
    }
  }
}
