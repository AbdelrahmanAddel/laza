import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/constants/assets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.removePrefixIcon = false,
  });
  final String hintText;
  final TextEditingController controller;
  final bool removePrefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275.w,
      height: 50.h,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: 15.sp,
          color: const Color(0xFF8F959E),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF5F6FA),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 20.h,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: const Color(0xFF8F959E),
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: removePrefixIcon
              ? null
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SvgPicture.asset(
                    Assets.imagesSvgSearchIcon,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF8F959E),
                      BlendMode.srcIn,
                    ),
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 30.w,
            minHeight: 20.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Color(0xFF9775FA), width: 1.5),
          ),
        ),
      ),
    );
  }
}
