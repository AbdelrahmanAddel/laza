import 'package:dio/dio.dart';
import 'package:laza/api/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl:ApiConstant.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST('api/auth/login')
  Future<LoginResponseModel> login(@Body() LoginRequestModel request);
}
