import 'package:dio/dio.dart';
import 'package:laza/core/errors/exceptions.dart';
import 'package:laza/core/errors/handle_exception.dart';
import 'package:laza/features/login/data/datasources/login_api_service.dart';
import 'package:laza/features/login/data/models/login_request_model.dart';
import 'package:laza/features/login/data/models/login_response_model.dart';
import 'package:laza/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiService _loginApiService;

  LoginRepositoryImpl(this._loginApiService);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await _loginApiService.login(request);
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
