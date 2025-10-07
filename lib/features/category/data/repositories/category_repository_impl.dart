import 'package:dio/dio.dart';
import 'package:laza/core/errors/handle_exception.dart';
import 'package:laza/features/category/data/datasources/category_api_service.dart';
import 'package:laza/features/category/data/mapper/category_mapper.dart';
import 'package:laza/features/category/domain/entities/category_entity.dart';
import 'package:laza/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApiService apiService;

  CategoryRepositoryImpl({required this.apiService});

  @override
  Future<List<Category>>? getCategories() async {
    try {
      final response = await apiService.getCategories();
      print('=>>>>>>> $response');
      return CategoryMapper.toEntity(response);
    } on DioException catch (error) {
      HandleException.handle(error);
      rethrow;
    }
  }
}
