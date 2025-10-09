import 'package:dio/dio.dart';
import 'package:laza/core/common/models/error_model.dart';
import 'package:laza/core/errors/server_exception.dart';

class HandleException {
  static void handle(DioException error) {
    final errorModel = ErrorModel.fromJson(error.response?.data);
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(errorModel: errorModel);
      case DioExceptionType.sendTimeout:
        throw ServerException(errorModel: errorModel);
      case DioExceptionType.receiveTimeout:
        throw ServerException(errorModel: errorModel);
      case DioExceptionType.badCertificate:
        throw ServerException(errorModel: errorModel);
      case DioExceptionType.badResponse:
        _handleBadRequest(errorModel, error.response?.statusCode ?? 0);
      case DioExceptionType.cancel:
        throw ServerException(errorModel: errorModel);
      case DioExceptionType.connectionError:
        throw ServerException(errorModel: errorModel);
      case DioExceptionType.unknown:
        throw ServerException(errorModel: errorModel);
    }
  }

  static _handleBadRequest(ErrorModel errorModel, int statusCode) {
    switch (statusCode) {
      case 400:
        throw ServerException(errorModel: errorModel);
      case 401:
        throw ServerException(errorModel: errorModel);
      case 403:
        throw ServerException(errorModel: errorModel);
      case 404:
        throw ServerException(errorModel: errorModel);
      case 500:
        throw ServerException(errorModel: errorModel);
      case 502:
        throw ServerException(errorModel: errorModel);
      case 503:
        throw ServerException(errorModel: errorModel);
      case 504:
        throw ServerException(errorModel: errorModel);
      default:
        throw ServerException(errorModel: errorModel);
    }
  }
}
