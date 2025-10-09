import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/custom_material_button.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/add_review/domain/entities/add_review_entity.dart';
import 'package:laza/features/add_review/presentation/controller/review_controllers.dart';
import 'package:laza/features/add_review/presentation/cubit/add_review_cubit.dart';
import 'package:laza/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:laza/features/add_review/presentation/widgets/add_review_body.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key, required this.productId});
  final String productId;

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  late final AddReviewController controller;

  @override
  void initState() {
    super.initState();
    controller = AddReviewController();
    controller.productId = widget.productId;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewCubit>(
      create: (context) => getIt(),
      child: Scaffold(
        bottomNavigationBar: CustomMaterialButton(
          text: 'Submit Review',
          onPressed: () async {
            if (controller.formKey.currentState!.validate()) {
              getIt<AddReviewCubit>().addReview(
                widget.productId,
                AddReviewRequest(
                  productId: widget.productId,
                  comment: controller.commentController.text,
                  rating: controller.rating.floor(),
                ),
              );
            }
          },
        ),
        backgroundColor: Colors.white,
        body: AddReviewBody(controller: controller),
      ),
    );
  }
}
