import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/product_details/presentation/screen/product_details_screen.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => ProductDetailsScreen(product: product),
          ),
        );
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product.id ?? '',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(product.coverPictureUrl ?? ''),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0, top: 5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite, color: AppColors.lightGrey),
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(5),
          Text(
            product.name ?? '',
            style: AppTextStyle.we500Si17ColText,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(5),
          Text(
            product.price.toString(),
            style: AppTextStyle.we500Si17ColText.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
