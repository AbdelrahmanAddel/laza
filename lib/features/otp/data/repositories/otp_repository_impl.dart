import 'package:dio/dio.dart';
import 'package:laza/core/errors/exceptions.dart';
import 'package:laza/core/errors/handle_exception.dart';
import 'package:laza/features/otp/data/datasources/otp_api_service.dart';
import 'package:laza/features/otp/data/models/otp_request_model.dart';
import 'package:laza/features/otp/domain/repositories/otp_repository.dart';

class OtpRepositoryImpl implements OtpRepository {
  final OtpApiService _otpApiService;

  OtpRepositoryImpl(this._otpApiService);

  @override
  Future<String> validateOtp(OtpRequestModel request) async {
    try {
      await _otpApiService.validateOtp(request);
      return 'Email verified successfully';
    } on DioException catch (error) {
      HandleException.handle(error);
      rethrow;
    } catch (e) {
      throw UnExceptedServerException(
        message: 'Unexpected error occurred',
        statusCode: 500,
      );
    }
  }
}
