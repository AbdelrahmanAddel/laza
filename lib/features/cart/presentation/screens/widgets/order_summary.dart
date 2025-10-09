import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text('Order Info', style: AppTextStyle.we500Si17ColText),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: AppTextStyle.we400Si15ColGrey),
            Text('\$110', style: AppTextStyle.we500Si17ColText),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping cost', style: AppTextStyle.we400Si15ColGrey),
            Text('\$10', style: AppTextStyle.we500Si17ColText),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: AppTextStyle.we400Si15ColGrey),
            Text('\$120', style: AppTextStyle.we500Si17ColText),
          ],
        ),
      ],
    );
  }
}
