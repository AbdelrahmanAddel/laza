import 'package:dio/dio.dart';
import 'package:laza/api/api_constant.dart';
import 'package:laza/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:laza/features/cart/data/models/cart_model.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio) = _CartApiService;

  @POST('/api/cart/items')
  Future<void> addToCart(@Body() AddToCartRequestModel request);

  @GET('/api/cart')
  Future<CartModel> getCart();
}
