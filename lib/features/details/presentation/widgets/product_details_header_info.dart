import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class ProductDetailsHeaderInfo extends StatelessWidget {
  const ProductDetailsHeaderInfo({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.name ?? '',
              style: AppTextStyle.we600Si28ColText.copyWith(fontSize: 22),
            ),
            Text(
              '\$${product.price}',
              style: AppTextStyle.we600Si28ColText.copyWith(fontSize: 22),
            ),
          ],
        ),
      ],
    );
  }
}
