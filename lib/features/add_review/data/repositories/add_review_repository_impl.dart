import 'package:dio/dio.dart';
import 'package:laza/core/errors/handle_exception.dart';
import 'package:laza/features/add_review/data/datasources/add_review_api_service.dart';
import 'package:laza/features/add_review/data/mapper/add_review_mapper.dart';
import 'package:laza/features/add_review/domain/entities/add_review_entity.dart';
import 'package:laza/features/add_review/domain/repositories/add_review_repository.dart';

class AddReviewRepositoryImpl implements AddReviewRepository {
  final AddReviewApiService apiService;

  AddReviewRepositoryImpl({required this.apiService});

  @override
  Future<AddReviewResponse>? addReview(String userId, AddReviewRequest request) async {
    try {
      final requestModel = AddReviewMapper.toRequestModel(request);
      final response = await apiService.addReview(userId, requestModel);
      return AddReviewMapper.toEntity(response);
    } on DioException catch (error) {
      HandleException.handle(error);
      rethrow;
    }
  }
}
