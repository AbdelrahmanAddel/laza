import 'package:laza/features/home/domain/entities/product_entity.dart';

abstract interface class HomeRepository {
  Future<List<Product>>? getProducts();
}
