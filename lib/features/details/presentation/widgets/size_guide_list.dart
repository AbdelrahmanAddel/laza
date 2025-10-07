import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/details/presentation/widgets/custom_text_row.dart';

class SizeGuideList extends StatelessWidget {
  const SizeGuideList({super.key});
  

  @override
  Widget build(BuildContext context) {
    List<String> sizes = ['S', 'M', 'L', 'XL', '2XL', '3XL'];
    return Column(
      children: [
        CustomTextRow(firstText: 'Size', secondText: 'Size Guide'),
        verticalSpace(11),
        SizedBox(
          height: 65,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightGrey,
                ),
                child: Center(
                  child: Text(
                    sizes[index],
                    style: AppTextStyle.we500Si17ColText,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return horizontalSpace(9);
            },
            itemCount: sizes.length,
          ),
        ),
      ],
    );
  }
}
