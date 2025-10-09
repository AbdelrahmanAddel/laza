import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/constants/assets.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/cart/presentation/cubit/cart_cubit.dart';

class DetailsScreenHeader extends StatelessWidget {
  const DetailsScreenHeader({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(Assets.imagesSvgBackIcon),
        ),
        GestureDetector(
          onTap: () {
            getIt<CartCubit>().addToCart(productId, 1);
          },
          child: SvgPicture.asset(Assets.imagesSvgCartIcon),
        ),
      ],
    );
  }
}
