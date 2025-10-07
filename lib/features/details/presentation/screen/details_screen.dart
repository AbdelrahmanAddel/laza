import 'package:flutter/material.dart';
import 'package:laza/features/details/presentation/widgets/product_details_body.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProductDetailsBody(product: product),
    );
  }
}
