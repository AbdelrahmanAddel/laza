import 'package:flutter/material.dart';
import 'package:laza/core/common/form_field_validation.dart';

class LoginTextFormFiled extends StatelessWidget {
  const LoginTextFormFiled({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.type,
  });
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextFormFieldsType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: textFormFieldValidator(type),
      controller: controller,
      decoration: InputDecoration(hintText: hintText, labelText: labelText),
    );
  }
}
