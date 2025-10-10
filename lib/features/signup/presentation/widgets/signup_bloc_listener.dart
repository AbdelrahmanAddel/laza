import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/features/login/presentation/screen/login_screen.dart';
import 'package:laza/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:laza/features/signup/presentation/cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) {
        return current is SignupSuccess ||
            current is SignupFailure ||
            current is LoadingToSignup;
      },
      listener: (context, state) {
        switch (state) {
          case SignupSuccess():
            Navigation.pop(context);
            _showToast(state.message, context);

            Navigation.push(LoginScreen(), context);
          case SignupFailure():
            Navigation.pop(context);
            _errorState(state.errors, context);
          case LoadingToSignup():
            showDialog(
              context: context,
              builder: (builder) {
                return const Center(child: CircularProgressIndicator());
              },
            );
          default:
            const SizedBox.shrink();
        }
      },
      child: const SizedBox.shrink(),
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

  Future<bool?> _showToast(String message, BuildContext context) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.lightGreen,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
