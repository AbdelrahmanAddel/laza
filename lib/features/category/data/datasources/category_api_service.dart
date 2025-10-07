import 'package:dio/dio.dart';
import 'package:laza/api/api_constant.dart';
import 'package:laza/features/category/data/models/category_model.dart';
import 'package:retrofit/retrofit.dart';

part 'category_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CategoryApiService {
  factory CategoryApiService(Dio dio) = _CategoryApiService;

  @GET(ApiConstant.categoryEndPoint)
  Future<CategoriesResponse> getCategories();
}
