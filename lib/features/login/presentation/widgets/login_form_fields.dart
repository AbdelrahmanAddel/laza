import 'package:flutter/material.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/login/presentation/widgets/login_text_form_field.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTextFormFiled(hintText: 'Username', labelText: 'Username'),
        verticalSpace(25),
        LoginTextFormFiled(hintText: 'Password', labelText: 'Password'),
      ],
    );
  }
}
