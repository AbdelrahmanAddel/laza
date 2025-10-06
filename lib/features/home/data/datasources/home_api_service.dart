import 'package:dio/dio.dart';
import 'package:laza/api/api_constant.dart';
import 'package:laza/features/home/data/models/products_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstant.productEndPoint)
  Future<ProductResponse> getProducts();
}
