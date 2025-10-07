import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/details/presentation/screen/details_screen.dart';
import 'package:laza/features/home/domain/entities/product_entity.dart';
import 'package:laza/features/home/presentation/cubit/home_cubit.dart';
import 'package:laza/features/home/presentation/cubit/home_state.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is HomeProductsLoaded ||
            current is ErrorToLoadHomeProduct ||
            current is LoadingToLoadHomeProduct;
      },
      builder: (context, state) {
        return switch (state) {
          LoadingToLoadHomeProduct() => _loading(),
          HomeProductsLoaded() => _products(state.products ?? []),
          ErrorToLoadHomeProduct() => _error(state.message),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _products(List<Product> products) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      itemBuilder: (context, index) {
        return _productItem(products[index], context);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 8 / 14,
      ),
    );
  }

  Widget _error(String message) {
    return Center(child: Text(message));
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _productItem(Product product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => ProductDetailsScreen(product: product,)),
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
          Text(product.name ?? '', style: AppTextStyle.we500Si17ColText),
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
