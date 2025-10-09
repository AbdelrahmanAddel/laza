import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/core/common/widgets/read_more_widget.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyle.we600Si28ColText.copyWith(fontSize: 17),
        ),
        verticalSpace(10),
        ReadMoreWidget(text: product.description ?? ''),
      ],
    );
  }
}
