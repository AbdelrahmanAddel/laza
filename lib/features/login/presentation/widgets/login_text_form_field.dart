import 'package:flutter/material.dart';

class LoginTextFormFiled extends StatelessWidget {
  const LoginTextFormFiled({
    super.key,
    required this.hintText,
    required this.labelText,
  });
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText, labelText: labelText),
    );
  }
}
