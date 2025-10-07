import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/details/presentation/widgets/product_description.dart';
import 'package:laza/features/details/presentation/widgets/product_details_header_info.dart';
import 'package:laza/features/details/presentation/widgets/product_image_list.dart';
import 'package:laza/features/details/presentation/widgets/size_guide_list.dart';
import 'package:laza/features/details/presentation/widgets/reviews.dart';
import 'package:laza/features/details/presentation/widgets/total_price.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsHeaderInfo(product: product),
          verticalSpace(21),
          ProductImageList(product: product),
          verticalSpace(15),
          SizeGuideList(),
          verticalSpace(15),
          ProductDescription(product: product),
          verticalSpace(15),
          Reviews(product: product),
          verticalSpace(20),
          TotalPrice(product: product),
        ],
      ),
    );
  }
}
 
