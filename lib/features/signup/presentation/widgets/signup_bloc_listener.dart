import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/custom_show_dialog.dart';
import 'package:laza/core/common/widgets/custom_show_toast.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/features/otp/presentation/screen/otp_screen.dart';
import 'package:laza/features/signup/presentation/controllers/signup_controllers.dart';
import 'package:laza/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:laza/features/signup/presentation/cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key, required this.email});
  final   SignupControllers email;

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
            customShowToast(state.message, context);

            Navigation.push(
              OTPScreen(email: email.emailController.text),
              context,
            );
          case SignupFailure():
            Navigation.pop(context);
            customShowDialogErrorState(state.errors, context);
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
}
