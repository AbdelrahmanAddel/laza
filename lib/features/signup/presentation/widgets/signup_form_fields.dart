import 'package:flutter/material.dart';
import 'package:laza/core/common/form_field_validation.dart';
import 'package:laza/core/common/widgets/login_text_form_field.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/signup/presentation/controllers/signup_controllers.dart';

class SignupFormFields extends StatelessWidget {
  const SignupFormFields({super.key, required this.controllers});
  final SignupControllers controllers;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controllers.formKey,
      child: Column(
        children: [
          AuthTextFormFiled(
            hintText: 'Enter your first name',
            labelText: 'First Name',
            controller: controllers.firstNameController,
            type: TextFormFieldsType.name,
          ),
          verticalSpace(20),
          AuthTextFormFiled(
            hintText: 'Enter your last name',
            labelText: 'Last Name',
            controller: controllers.lastNameController,
            type: TextFormFieldsType.name,
          ),
          verticalSpace(20),
          AuthTextFormFiled(
            hintText: 'Enter your email',
            labelText: 'Email',
            controller: controllers.emailController,
            type: TextFormFieldsType.email,
          ),
          verticalSpace(20),
          AuthTextFormFiled(
            hintText: 'Enter your password',
            labelText: 'Password',
            controller: controllers.passwordController,
            type: TextFormFieldsType.password,
          ),
        ],
      ),
    );
  }
}
