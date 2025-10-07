import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/details/presentation/widgets/details_screen_header.dart';
import 'package:laza/features/details/presentation/widgets/product_details_info.dart';
import 'package:laza/core/common/widgets/custom_material_button.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Hero(
                tag: product.id ?? '',
                child: Image.network(
                  fit: BoxFit.fill,
                  width: 375.w,
                  height: 418.h,
                  product.coverPictureUrl ?? '',
                ),
              ),
              verticalSpace(15),
              ProductDetailsInfo(product: product),
              verticalSpace(20),
              CustomMaterialButton(text: 'Add to Cart'),
            ],
          ),
          _productDetailsHeader(),
        ],
      ),
    );
  }

  Widget _productDetailsHeader() {
    return Positioned(
      top: 40.h,
      left: 10.w,
      right: 10.w,
      child: DetailsScreenHeader(),
    );
  }
}
