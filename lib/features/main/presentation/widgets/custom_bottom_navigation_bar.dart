import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/assets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: currentIndex == 0
              ? Text('Home', style: AppTextStyle.we500Si11ColPrimary)
              : SvgPicture.asset(Assets.imagesSvgHome),
          label: currentIndex == 0 ? '' : 'Home',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? Text('Wishlist', style: AppTextStyle.we500Si11ColPrimary)
              : SvgPicture.asset(Assets.imagesSvgWishlist),
          label: currentIndex == 1 ? '' : 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 2
              ? Text('Cart', style: AppTextStyle.we500Si11ColPrimary)
              : SvgPicture.asset(Assets.imagesSvgCart),
          label: currentIndex == 2 ? '' : 'Cart',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 3
              ? Text('Wallet', style: AppTextStyle.we500Si11ColPrimary)
              : SvgPicture.asset(Assets.imagesSvgWallet),
          label: currentIndex == 3 ? '' : 'Wallet',
        ),
      ],
    );
  }
}