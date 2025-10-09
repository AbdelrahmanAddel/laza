import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/add_review/presentation/controller/review_controllers.dart';
import 'package:laza/features/add_review/presentation/widgets/custom_text_form_filed.dart';

class AddReviewFormFields extends StatelessWidget {
  const AddReviewFormFields({super.key, required this.controller});
  final AddReviewController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormFiled(
          hintText: 'Type your name',
          controller: controller.nameController,
          maxLines: 1,
        ),
        verticalSpace(20),
        Text('How was your experience ?', style: AppTextStyle.we500Si17ColText),
        verticalSpace(10),
        CustomTextFormFiled(
          hintText: 'Describe your experience?',
          controller: controller.commentController,
          maxLines: 7,
        ),
      ],
    );
  }
}
