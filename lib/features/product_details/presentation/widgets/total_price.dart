import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Price'),
            Text(
              'with VAT,SD',
              style: AppTextStyle.we400Si15ColGrey.copyWith(fontSize: 11),
            ),
          ],
        ),
        Text(
          '\$${product.price}',
          style: AppTextStyle.we600Si28ColText.copyWith(fontSize: 22),
        ),
      ],
    );
  }
}
