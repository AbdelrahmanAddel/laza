import 'package:laza/features/category/domain/entities/category_entity.dart';

abstract interface class CategoryRepository {
  Future<List<Category>>? getCategories();
}
