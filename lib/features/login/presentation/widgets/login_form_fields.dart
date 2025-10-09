import 'package:flutter/material.dart';
import 'package:laza/core/common/form_field_validation.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/login/presentation/controllers/login_controllers.dart';
import 'package:laza/features/login/presentation/widgets/login_text_form_field.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key, required this.controllers});
  final LoginControllers controllers;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controllers.formKey,
      child: Column(
        children: [
          LoginTextFormFiled(
            hintText: 'Username',
            labelText: 'Username',
            controller: controllers.emailController,
            type: TextFormFieldsType.email,
          ),
          verticalSpace(25),
          LoginTextFormFiled(
            hintText: 'Password',
            labelText: 'Password',
            controller: controllers.passwordController,
            type: TextFormFieldsType.password,
          ),
        ],
      ),
    );
  }
}
