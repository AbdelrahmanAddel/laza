import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/add_review/domain/entities/add_review_entity.dart';
import 'package:laza/features/add_review/presentation/cubit/add_review_cubit.dart';
import 'package:laza/features/add_review/presentation/cubit/add_review_state.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({
    super.key,
    required this.productId,
    required this.userId,
  });
  
  final String productId;
  final String userId;

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _commentController = TextEditingController();
  int _rating = 5;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddReviewCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Review', style: AppTextStyle.we600Si28ColText),
          centerTitle: true,
        ),
        body: BlocConsumer<AddReviewCubit, AddReviewState>(
          listener: (context, state) {
            if (state is ReviewAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.response.message ?? 'Review added successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigation.pop(context);
            } else if (state is ErrorToAddReview) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rating',
                      style: AppTextStyle.we500Si17ColText,
                    ),
                    verticalSpace(10),
                    Row(
                      children: List.generate(5, (index) {
                        return IconButton(
                          onPressed: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                          icon: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: AppColors.secondaryColor,
                            size: 32,
                          ),
                        );
                      }),
                    ),
                    verticalSpace(20),
                    Text(
                      'Comment',
                      style: AppTextStyle.we500Si17ColText,
                    ),
                    verticalSpace(10),
                    TextField(
                      controller: _commentController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Write your review here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MaterialButton(
                        color: AppColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: state is LoadingToAddReview
                            ? null
                            : () {
                                if (_commentController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please write a comment'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                final request = AddReviewRequest(
                                  productId: widget.productId,
                                  comment: _commentController.text,
                                  rating: _rating,
                                );

                                context.read<AddReviewCubit>().addReview(
                                      widget.userId,
                                      request,
                                    );
                              },
                        child: state is LoadingToAddReview
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Submit Review',
                                style: AppTextStyle.we500Si13CollightGrey,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
