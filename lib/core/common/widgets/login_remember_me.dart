import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:laza/core/constants/app_colors.dart';

class AuthRememberMe extends StatefulWidget {
  const AuthRememberMe({super.key});

  @override
  State<AuthRememberMe> createState() => _AuthRememberMeState();
}

class _AuthRememberMeState extends State<AuthRememberMe> {
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
