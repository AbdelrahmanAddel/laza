import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/features/cart/domain/entities/cart_entity.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return CartItemWidget(item: item);
      },
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.network(item.productCoverUrl, width: 100, height: 100, fit: BoxFit.cover),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.productName, style: AppTextStyle.we500Si17ColText.copyWith(fontSize: 15), maxLines: 2, overflow: TextOverflow.ellipsis,),
                Text('\$${item.finalPricePerUnit.toStringAsFixed(2)}', style: AppTextStyle.we400Si15ColGrey),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 15, child: Icon(Icons.remove, size: 15)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(item.quantity.toString(), style: AppTextStyle.we500Si17ColText),
                        ),
                        const CircleAvatar(radius: 15, child: Icon(Icons.add, size: 15)),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
