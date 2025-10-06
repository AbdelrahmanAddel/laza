import 'package:flutter/material.dart';
import 'package:laza/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/spaceing.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      itemBuilder: (context, index) {
        return _productItem();
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 8 / 14,
      ),
    );
  }

  Widget _productItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'https://media.about.nike.com/img/cf68f541-fc92-4373-91cb-086ae0fe2f88/002-nike-logos-swoosh-white.jpg?m=eyJlZGl0cyI6eyJqcGVnIjp7InF1YWxpdHkiOjEwMH0sIndlYnAiOnsicXVhbGl0eSI6MTAwfSwiZXh0cmFjdCI6eyJsZWZ0IjozMzQsInRvcCI6MCwid2lkdGgiOjQwOTAsImhlaWdodCI6MjcyOH0sInJlc2l6ZSI6eyJ3aWR0aCI6OTAwfX19&s=b47e8cc4991bc508a5b762df7d8679aa1406407f56bc774089362de8797930f1',
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0, top: 5),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.favorite, color: AppColors.lightGrey),
              ),
            ),
          ),
        ),
        verticalSpace(5),
        Text('Nike', style: AppTextStyle.we500Si17ColText),
        verticalSpace(5),
        Text(
          '100\$',
          style: AppTextStyle.we500Si17ColText.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
