import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/home/presentation/widgets/brand_list.dart';
import 'package:laza/features/home/presentation/widgets/home_screen_header.dart';
import 'package:laza/features/home/presentation/widgets/home_screen_search_bar.dart';
import 'package:laza/features/home/presentation/widgets/product_list.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeScreenHeader(),
              verticalSpace(20),
              Text('Hello', style: AppTextStyle.we600Si28ColText),
              verticalSpace(5),
              Text('Welcome to Laza.', style: AppTextStyle.we400Si15ColGrey),
              verticalSpace(20),
              HomeScreenSearchBar(),
              verticalSpace(20),
              _chooseBrand(),
              verticalSpace(17),
              BrandList(),
              verticalSpace(15),
              _newArrival(),
              verticalSpace(15),
              ProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _newArrival() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('New Arrival', style: AppTextStyle.we500Si17ColText),
        Text(
          'View All',
          style: AppTextStyle.we400Si15ColGrey.copyWith(fontSize: 13),
        ),
      ],
    );
  }

  Widget _chooseBrand() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Choose Brand', style: AppTextStyle.we500Si17ColText),
        Text(
          'View All',
          style: AppTextStyle.we400Si15ColGrey.copyWith(fontSize: 13),
        ),
      ],
    );
  }

 
}

