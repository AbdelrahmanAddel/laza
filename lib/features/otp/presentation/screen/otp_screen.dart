import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/otp/data/models/otp_request_model.dart';
import 'package:laza/core/common/widgets/custom_material_button.dart';
import 'package:laza/features/otp/presentation/controllers/otp_controllers.dart';
import 'package:laza/features/otp/presentation/cubit/otp_cubit.dart';
import 'package:laza/features/otp/presentation/widgets/otp_screen_body.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email});
  final String email;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final OtpControllers otpControllers;

  @override
  void initState() {
    otpControllers = OtpControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtpCubit>(),
      child: Scaffold(
        bottomNavigationBar: CustomMaterialButton(
          text: 'Confirm Code',
          onPressed: () {
            if (otpControllers.formKey.currentState!.validate()) {
              getIt<OtpCubit>().validateOtp(
                OtpRequestModel(
                  email: widget.email,
                  otp: otpControllers.otpController.text,
                ),
              );
            }
          },
        ),
        body: OTPScreenBody(otpControllers: otpControllers),
      ),
    );
  }
}
