import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class ProductImageList extends StatelessWidget {
  const ProductImageList({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 77,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              fit: BoxFit.fill,
              width: 77.w,
              height: 77.h,
              product.coverPictureUrl ?? '',
            ),
          );
        },
        separatorBuilder: (context, index) {
          return horizontalSpace(9);
        },
        itemCount: 10,
      ),
    );
  }
}
