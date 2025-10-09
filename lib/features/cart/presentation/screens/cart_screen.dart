import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/custom_material_button.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:laza/features/cart/presentation/screens/widgets/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..getCart(),
      child: const Scaffold(
        bottomNavigationBar: CustomMaterialButton(text: 'Checkout'),
        backgroundColor: Colors.white,
        body: CartScreenBody(),
      ),
    );
  }
}
