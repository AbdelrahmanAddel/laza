import 'package:flutter/material.dart';
import 'package:laza/core/common/form_field_validation.dart';
import 'package:laza/features/otp/presentation/controllers/otp_controllers.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPField extends StatelessWidget {
  const OTPField({super.key, required this.otpControllers});
  final OtpControllers otpControllers;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      validator: textFormFieldValidator(TextFormFieldsType.otp),
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        otpControllers.otpController.text = value;
      },
    );
  }
}
