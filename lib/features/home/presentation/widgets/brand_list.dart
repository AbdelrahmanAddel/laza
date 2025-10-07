import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/category/domain/entities/category_entity.dart';
import 'package:laza/features/category/presentation/cubit/category_cubit.dart';
import 'package:laza/features/category/presentation/cubit/category_state.dart';

class BrandList extends StatelessWidget {
  const BrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>()..getCategories(),
      child: SizedBox(
        height: 50.h,
        width: double.infinity,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            switch (state) {
              case LoadingToLoadCategories():
                return const Center(child: CircularProgressIndicator());
              case CategoriesLoaded():
                return ListView.separated(
                  itemCount: state.categories?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _brandItem(state.categories?[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return horizontalSpace(20);
                  },
                );
              case ErrorToLoadCategories():
                return const Center(child: Text('Some thing wen\'t wrong'));
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

Widget _brandItem(Category? category) {
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
            child: SvgPicture.network(
              color: Colors.black,
              fit: BoxFit.contain,
              category?.coverPictureUrl ?? '',
            ),
          ),

          Text(category?.name ?? ''),
        ],
      ),
    ),
  );
}
