import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/add_review/presentation/controller/review_controllers.dart';
import 'package:laza/features/add_review/presentation/widgets/add_reviews_form_fields.dart';
import 'package:laza/features/add_review/presentation/widgets/review_stars.dart';
import 'package:laza/features/reviews/presentation/widgets/review_header.dart';

class AddReviewBody extends StatelessWidget {
  const AddReviewBody({super.key, required this.controller});
  final AddReviewController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewHeader(),
                  verticalSpace(38),
                  Text('Name', style: AppTextStyle.we500Si17ColText),
                  verticalSpace(10),
                  AddReviewFormFields(controller: controller),
                  verticalSpace(20),
                  ReviewStars(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


