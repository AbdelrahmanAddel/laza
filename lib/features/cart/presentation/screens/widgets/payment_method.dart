import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/assets.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Payment Method', style: AppTextStyle.we500Si17ColText),
            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            SvgPicture.asset(Assets.imagesSvgVisa,), 
            const SizedBox(width: 15),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Visa Classic'),
                  Text('**** 7690', style: AppTextStyle.we400Si15ColGrey),
                ],
              ),
            ),
            const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ],
    );
  }
}
