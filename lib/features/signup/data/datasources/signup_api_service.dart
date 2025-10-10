import 'package:dio/dio.dart';
import 'package:laza/api/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

part 'signup_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class SignupApiService {
  factory SignupApiService(Dio dio) = _SignupApiService;

  @POST('api/auth/register')
  Future<SignupResponseModel> signup(@Body() SignupRequestModel request);
}
