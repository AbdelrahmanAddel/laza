import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:laza/features/cart/presentation/cubit/cart_state.dart';
import 'package:laza/features/cart/presentation/screens/widgets/cart_header.dart';
import 'package:laza/features/cart/presentation/screens/widgets/cart_item_list.dart';
import 'package:laza/features/cart/presentation/screens/widgets/order_summary.dart';
import 'package:laza/features/cart/presentation/screens/widgets/delivery_address.dart';
import 'package:laza/features/cart/presentation/screens/widgets/payment_method.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CartCubit, CartState>(
        buildWhen: (previous, current) {
          return current is GetCartLoading ||
              current is GetCartSuccess ||
              current is GetCartFailure;
        },
        builder: (context, state) {
          switch (state) {
            case GetCartLoading():
              return const Center(child: CircularProgressIndicator());
            case GetCartSuccess():
              return Column(
                children: [
                  const CartHeader(),
                   verticalSpace(20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CartItemList(cartItems: state.cart.cartItems),
                            const SizedBox(height: 30),
                            const DeliveryAddress(),
                            const SizedBox(height: 30),
                            const PaymentMethod(),
                            const SizedBox(height: 30),
                            const OrderSummary(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            case GetCartFailure():
              return Center(child: Text(state.message));
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
