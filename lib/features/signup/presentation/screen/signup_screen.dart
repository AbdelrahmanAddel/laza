import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/custom_material_button.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/signup/data/models/signup_request_model.dart';
import 'package:laza/features/signup/presentation/controllers/signup_controllers.dart';
import 'package:laza/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:laza/features/signup/presentation/widgets/signup_screen_body.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final SignupControllers _controllers;

  @override
  void initState() {
    _controllers = SignupControllers();
    super.initState();
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (context) => getIt(),
      child: Scaffold(
        bottomNavigationBar: CustomMaterialButton(
          text: 'Sign Up',
          onPressed: () {
            if (_controllers.formKey.currentState!.validate()) {
              getIt<SignupCubit>().signup(
                SignupRequestModel(
                  email: _controllers.emailController.text,
                  password: _controllers.passwordController.text,
                  firstName: _controllers.firstNameController.text,
                  lastName: _controllers.lastNameController.text,
                ),
              );
            }
          },
        ),
        body: SignupScreenBody(controllers: _controllers),
      ),
    );
  }
}
