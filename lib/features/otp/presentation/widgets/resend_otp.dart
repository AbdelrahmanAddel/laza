import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/features/otp/data/models/resend_otp_request_model.dart';
import 'package:laza/features/otp/presentation/cubit/otp_cubit.dart';

class ResendOTP extends StatefulWidget {
  const ResendOTP({super.key, required this.email});
  final String email;

  @override
  State<ResendOTP> createState() => _ResendOTPState();
}

class _ResendOTPState extends State<ResendOTP> {
  static const int _startMinutes = 10;
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = _startMinutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _resendOtp() {
    context.read<OtpCubit>().resendOtp(
      ResendOtpRequestModel(email: widget.email),
    );
    _startTimer();
  }

  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _remainingSeconds == 0
        ? Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: _resendOtp,
              child: Text(
                'Resend',
                style: AppTextStyle.we400Si15ColGrey.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          )
        : Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: _formatTime(_remainingSeconds),
                    style: AppTextStyle.we500Si13CollightGrey.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' resend confirmation code. ',
                    style: AppTextStyle.we400Si15ColGrey,
                  ),
                ],
              ),
            ),
          );
  }
}
