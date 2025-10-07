import 'package:laza/features/category/data/models/category_model.dart';
import 'package:laza/features/category/domain/entities/category_entity.dart';

class CategoryMapper {
  static List<Category> toEntity(CategoriesResponse? response) {
    if (response == null || response.categories == null) {
      return [];
    }

    return response.categories!.map((categoryModel) {
      return Category(
        id: categoryModel.id,
        name: categoryModel.name,
        description: categoryModel.description,
        coverPictureUrl: categoryModel.coverPictureUrl,
      );
    }).toList();
  }
}
