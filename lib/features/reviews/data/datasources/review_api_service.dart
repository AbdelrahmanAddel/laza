import 'package:dio/dio.dart';
import 'package:laza/api/api_constant.dart';
import 'package:laza/features/reviews/data/models/review_model.dart';
import 'package:retrofit/retrofit.dart';

part 'review_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ReviewApiService {
  factory ReviewApiService(Dio dio) = _ReviewApiService;

  @GET('${ApiConstant.reviewsEndPoint}/{productId}')
  Future<ReviewsResponseModel> getReviews(@Path('productId') String productId);
}
