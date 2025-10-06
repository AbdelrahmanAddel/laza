import 'package:dio/dio.dart';
import 'package:laza/core/errors/handle_exception.dart';
import 'package:laza/features/home/data/datasources/home_api_service.dart';
import 'package:laza/features/home/data/mapper/product_mapper.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';
import 'package:laza/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService apiService;

  HomeRepositoryImpl({required this.apiService});
  @override
  Future<List<Product>>? getProducts() async {
    try {
      final response = await apiService.getProducts();
      return ProductMapper.toEntity(response) ?? [];
    } on DioException catch (error) {
      HandleException.handle(error);
      rethrow;
    }
  }
}
