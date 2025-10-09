import 'package:flutter/material.dart';

class AddReviewEntity {
  String comment;
  String name;
  String productId;
  int rating;
  AddReviewEntity({
    required this.comment,
    required this.name,
    required this.productId,
    required this.rating,
  });
}

class AddReviewController {
  final commentController = TextEditingController();
  final nameController = TextEditingController();

  String? _productId;
  double rating = 2.5;

  set productId(String id) {
    _productId = id.trim().isEmpty ? null : id.trim();
  }

  AddReviewEntity? get entity {
    if (_productId == null || _productId!.isEmpty) return null;

    return AddReviewEntity(
      comment: commentController.text.trim(),
      rating: rating.floor(),
      productId: _productId!,
      name: nameController.text.trim(),
    );
  }

  void dispose() {
    commentController.dispose();
    nameController.dispose();
  }
}
