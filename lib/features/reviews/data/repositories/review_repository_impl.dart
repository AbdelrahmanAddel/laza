import 'package:dio/dio.dart';
import 'package:laza/core/errors/handle_exception.dart';
import 'package:laza/features/reviews/data/datasources/review_api_service.dart';
import 'package:laza/features/reviews/data/mapper/review_mapper.dart';
import 'package:laza/features/reviews/domain/entities/review_entity.dart';
import 'package:laza/features/reviews/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewApiService apiService;

  ReviewRepositoryImpl({required this.apiService});

  @override
  Future<ReviewsResponse>? getReviews(String productId) async {
    try {
      final response = await apiService.getReviews(productId);
      return ReviewMapper.toEntity(response);
    } on DioException catch (error) {
      HandleException.handle(error);
      rethrow;
    }
  }
}
