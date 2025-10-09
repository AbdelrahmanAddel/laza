import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/core/helper/shared_pref.dart';
import 'package:laza/features/home/presentation/screen/home_screen.dart';
import 'package:laza/features/login/presentation/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return current is LoginSuccess ||
            current is LoginFailure ||
            current is LoadingToLogin;
      },
      listener: (context, state) {
        switch (state) {
          case LoginSuccess():
            SharedPrefHelper.setSecuredString(
              'token',
              state.loginResponse.token,
            );
            Navigation.pop(context);
            Navigation.push(HomeScreen(), context);
          case LoginFailure():
            Navigation.pop(context);
            _errorState(state.errors, context);

          case LoadingToLogin():
            showDialog(
              context: context,
              builder: (builder) {
                return const Center(child: CircularProgressIndicator());
              },
            );
          default:
            SizedBox.shrink();
        }
      },
      child: SizedBox.shrink(),
    );
  }

  Future<dynamic> _errorState(String error, BuildContext context) {
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
}
