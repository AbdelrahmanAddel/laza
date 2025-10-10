import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/assets.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/otp/presentation/controllers/otp_controllers.dart';
import 'package:laza/features/otp/presentation/widgets/otp_bloc_listener.dart';
import 'package:laza/features/otp/presentation/widgets/otp_field.dart';
import 'package:laza/features/otp/presentation/widgets/resend_otp.dart';

class OTPScreenBody extends StatelessWidget {
  const OTPScreenBody({super.key, required this.otpControllers});
  final OtpControllers otpControllers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: otpControllers.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(Assets.imagesSvgBackIcon),
                verticalSpace(14),
                Center(
                  child: Text(
                    'Verification Code',
                    style: AppTextStyle.we600Si28ColText,
                  ),
                ),
                verticalSpace(68),
                Center(
                  child: Image.asset(
                    Assets.imagesPngForgetAndVerfiyImage,
                    width: 225.w,
                    height: 166.h,
                    fit: BoxFit.contain,
                  ),
                ),
                verticalSpace(60),
                OTPField(otpControllers: otpControllers),
                verticalSpace(166),
                ResendOTP(),
                OTPBlocLister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
