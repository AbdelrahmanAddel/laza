import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/product_item.dart';
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
        return ProductItem(product: products[index]);
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
}
