import 'package:laza/features/home/data/models/products_model.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class ProductMapper {
  static List<Product>? toEntity(ProductResponse model) {
    return model.items
        ?.map(
          (item) => Product(
            id: item.id,
            productCode: item.productCode,
            name: item.name,
            description: item.description,
            arabicName: item.arabicName,
            arabicDescription: item.arabicDescription,
            coverPictureUrl: item.coverPictureUrl,
            productPictures: item.productPictures,
            price: item.price,
            stock: item.stock,
            weight: item.weight,
            color: item.color,
            rating: item.rating,
            reviewsCount: item.reviewsCount,
            discountPercentage: item.discountPercentage,
            sellerId: item.sellerId,
            categories: item.categories,
          ),
        )
        .toList();
  }
}
