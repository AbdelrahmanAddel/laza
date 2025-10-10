import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/widgets/custom_show_dialog.dart';
import 'package:laza/core/common/widgets/custom_show_toast.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/features/login/presentation/screen/login_screen.dart';
import 'package:laza/features/otp/presentation/cubit/otp_cubit.dart';
import 'package:laza/features/otp/presentation/cubit/otp_state.dart';

class OTPBlocLister extends StatelessWidget {
  const OTPBlocLister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        switch (state) {
          case OtpSuccess():
            Navigation.pop(context);
            customShowToast('Success', context);
            Navigation.push(LoginScreen(), context);
          case OtpFailure():
            Navigation.pop(context);
            customShowDialogErrorState(state.errors, context);
          case LoadingToOtp():
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
      child: SizedBox.shrink(),
    );
  }
}
