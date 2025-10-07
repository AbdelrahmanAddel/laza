import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/constants/assets.dart';

class DetailsScreenHeader extends StatelessWidget {
  const DetailsScreenHeader({super.key});

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
        SvgPicture.asset(Assets.imagesSvgCartIcon),
      ],
    );
  }
}
