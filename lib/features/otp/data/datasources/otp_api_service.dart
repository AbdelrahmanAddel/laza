import 'package:dio/dio.dart';
import 'package:laza/api/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import '../models/otp_request_model.dart';

part 'otp_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class OtpApiService {
  factory OtpApiService(Dio dio) = _OtpApiService;

  @POST('/api/auth/verify-email')
  Future<void> validateOtp(@Body() OtpRequestModel request);
}
