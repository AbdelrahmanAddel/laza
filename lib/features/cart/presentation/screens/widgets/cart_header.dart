import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart', style: AppTextStyle.we600Si28ColText),
    );
  }
}
