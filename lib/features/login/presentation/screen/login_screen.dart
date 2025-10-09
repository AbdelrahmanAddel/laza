// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/common/widgets/custom_material_button.dart';
import 'package:laza/core/constants/app_colors.dart';
import 'package:laza/core/constants/assets.dart';
import 'package:laza/core/helper/navigation.dart';
import 'package:laza/core/helper/shared_pref.dart';
import 'package:laza/core/helper/spacing.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/home/presentation/screen/home_screen.dart';
import 'package:laza/features/login/data/models/login_request_model.dart';
import 'package:laza/features/login/presentation/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt(),
      child: Scaffold(
        bottomNavigationBar: CustomMaterialButton(
          text: 'Login',
          onPressed: () => getIt<LoginCubit>().login(
            LoginRequestModel(email: 'Abdelrahman Ade', password: '123123'),
          ),
        ),
        body: LoginScreenBody(),
      ),
    );
  }
}

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

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By connecting your account confirm that you agree with our ',
            style: AppTextStyle.we400Si15ColGrey.copyWith(fontSize: 13),
          ),
          TextSpan(
            text: 'Term and Condition',
            style: AppTextStyle.we500Si13CollightGrey.copyWith(
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginRememberMe extends StatefulWidget {
  const LoginRememberMe({super.key});

  @override
  State<LoginRememberMe> createState() => _LoginRememberMeState();
}

class _LoginRememberMeState extends State<LoginRememberMe> {
  bool rememberMe = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Remember me',
          style: AppTextStyle.we400Si15ColGrey.copyWith(
            color: AppColors.textColor,
          ),
        ),
        Switch(
          activeColor: Colors.white,
          activeTrackColor: Color(0xff34C759),
          inactiveTrackColor: AppColors.lightGrey,

          value: rememberMe,
          onChanged: (_) {
            setState(() {
              rememberMe = !rememberMe;
            });
          },
        ),
      ],
    );
  }
}

class LoginForgetPassword extends StatelessWidget {
  const LoginForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Forgot password?',
        style: AppTextStyle.we400Si15ColGrey.copyWith(
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTextFormFiled(hintText: 'Username', labelText: 'Username'),
        verticalSpace(25),
        LoginTextFormFiled(hintText: 'Password', labelText: 'Password'),
      ],
    );
  }
}

class LoginTextFormFiled extends StatelessWidget {
  const LoginTextFormFiled({
    super.key,
    required this.hintText,
    required this.labelText,
  });
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText, labelText: labelText),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Welcome', style: AppTextStyle.we600Si28ColText),
          verticalSpace(5),
          Text(
            'Please enter your data to continue',
            style: AppTextStyle.we400Si15ColGrey,
          ),
        ],
      ),
    );
  }
}
