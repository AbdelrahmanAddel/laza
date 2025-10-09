// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/custom_material_button.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/login/data/models/login_request_model.dart';
import 'package:laza/features/login/presentation/cubit/login_cubit.dart';
import 'package:laza/features/login/presentation/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt(),
      child: Scaffold(
        bottomNavigationBar: CustomMaterialButton(
          text: 'Login',
          onPressed: () => getIt<LoginCubit>().login(
            LoginRequestModel(email: 'Abdelrahman Ade', password: '123123'),
          ),
        ),
        body: LoginScreenBody(),
      ),
    );
  }
}
// separate