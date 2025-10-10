import 'package:dio/dio.dart';
import 'package:laza/core/errors/exceptions.dart';
import 'package:laza/core/errors/handle_exception.dart';
import 'package:laza/features/signup/data/datasources/signup_api_service.dart';
import 'package:laza/features/signup/data/models/signup_request_model.dart';
import 'package:laza/features/signup/data/models/signup_response_model.dart';
import 'package:laza/features/signup/domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupApiService _signupApiService;

  SignupRepositoryImpl(this._signupApiService);

  @override
  Future<SignupResponseModel> signup(SignupRequestModel request) async {
    try {
      final response = await _signupApiService.signup(request);
      return response;
    } on DioException catch (e) {
      HandleException.handle(e);
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'Unexpected error occurred',
        statusCode: 500,
      );
    }
  }
}
