// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/custom_material_button.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/login/data/models/login_request_model.dart';
import 'package:laza/features/login/presentation/controllers/login_controllers.dart';
import 'package:laza/features/login/presentation/cubit/login_cubit.dart';
import 'package:laza/features/login/presentation/widgets/login_screen_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginControllers _controllers;
  @override
  void initState() {
    _controllers = LoginControllers();
    super.initState();
  }

  @override
  void dispose() {
    _controllers.emailController.dispose();
    _controllers.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt(),
      child: Scaffold(
        bottomNavigationBar: CustomMaterialButton(
          text: 'Login',
          onPressed: () {
            if (_controllers.formKey.currentState!.validate()) {
              getIt<LoginCubit>().login(
                LoginRequestModel(
                  email: _controllers.emailController.text,
                  password: _controllers.passwordController.text,
                ),
              );
            }
          },
        ),
        body: LoginScreenBody(controllers: _controllers),
      ),
    );
  }
}
