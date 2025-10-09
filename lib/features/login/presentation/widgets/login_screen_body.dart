import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/constants/assets.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/features/login/presentation/widgets/login_header.dart';
import 'package:laza/features/login/presentation/widgets/login_form_fields.dart';
import 'package:laza/features/login/presentation/widgets/login_forget_password.dart';
import 'package:laza/features/login/presentation/widgets/login_remember_me.dart';
import 'package:laza/features/login/presentation/widgets/term_and_condition.dart';
import 'package:laza/features/login/presentation/widgets/login_bloc_listener.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

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
              LoginHeader(),
              verticalSpace(164),
              LoginFormFields(),
              verticalSpace(30),
              LoginForgetPassword(),
              verticalSpace(40),
              LoginRememberMe(),
              verticalSpace(107),
              TermAndCondition(),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
