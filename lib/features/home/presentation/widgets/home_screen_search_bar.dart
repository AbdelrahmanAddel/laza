import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/features/home/presentation/widgets/custom_search_text_field.dart';

class HomeScreenSearchBar extends StatelessWidget {
  const HomeScreenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSearchTextField(
          hintText: 'Search',
          controller: TextEditingController(),
        ),
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(Icons.mic, color: Colors.white),
        ),
      ],
    );
  }
}
