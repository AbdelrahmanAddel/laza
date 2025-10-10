import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/common/widgets/login_remember_me.dart';
import 'package:laza/core/constants/assets.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/signup/presentation/controllers/signup_controllers.dart';
import 'package:laza/features/signup/presentation/widgets/signup_form_fields.dart';
import 'package:laza/features/signup/presentation/widgets/signup_bloc_listener.dart';

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({super.key, required this.controllers});
  final SignupControllers controllers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.imagesSvgBackIcon),
              Center(
                child: Text('Sign Up', style: AppTextStyle.we600Si28ColText),
              ),
              verticalSpace(152),
              SignupFormFields(controllers: controllers),
              verticalSpace(40),
              AuthRememberMe(),
              SignupBlocListener(email: controllers),
            ],
          ),
        ),
      ),
    );
  }
}
