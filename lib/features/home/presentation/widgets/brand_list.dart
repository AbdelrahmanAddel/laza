import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/spaceing.dart';

class BrandList extends StatelessWidget {
  const BrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _brandItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return horizontalSpace(20);
        },
      ),
    );
  }

  Widget _brandItem() {
    return Container(
      height: 50.h,
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.lightGrey,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                fit: BoxFit.fill,
                'https://media.about.nike.com/img/cf68f541-fc92-4373-91cb-086ae0fe2f88/002-nike-logos-swoosh-white.jpg?m=eyJlZGl0cyI6eyJqcGVnIjp7InF1YWxpdHkiOjEwMH0sIndlYnAiOnsicXVhbGl0eSI6MTAwfSwiZXh0cmFjdCI6eyJsZWZ0IjozMzQsInRvcCI6MCwid2lkdGgiOjQwOTAsImhlaWdodCI6MjcyOH0sInJlc2l6ZSI6eyJ3aWR0aCI6OTAwfX19&s=b47e8cc4991bc508a5b762df7d8679aa1406407f56bc774089362de8797930f1',
                width: 40.w,
                height: 40.h,
              ),
            ),
            Text('Any thing'),
          ],
        ),
      ),
    );
  }
}
