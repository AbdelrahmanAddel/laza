import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/helper/navigation.dart';

Future<dynamic> customShowDialogErrorState(String error, BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(Icons.error, color: Colors.red, size: 32),
      content: Text(error, style: AppTextStyle.we500Si17ColText),
      actions: [
        TextButton(
          onPressed: () {
            Navigation.pop(context);
          },
          child: Text('Got it', style: AppTextStyle.we600Si28ColText),
        ),
      ],
    ),
  );
}
