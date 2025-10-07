import 'package:dio/dio.dart';
import 'package:laza/api/api_constant.dart';
import 'package:laza/features/add_review/data/models/add_review_model.dart';
import 'package:retrofit/retrofit.dart';

part 'add_review_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AddReviewApiService {
  factory AddReviewApiService(Dio dio) = _AddReviewApiService;

  @POST('${ApiConstant.reviewsEndPoint}/{userId}')
  Future<AddReviewResponseModel> addReview(
    @Path('userId') String userId,
    @Body() AddReviewRequestModel request,
  );
}
