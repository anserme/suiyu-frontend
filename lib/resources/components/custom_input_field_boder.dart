import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_colors/app_dark_colors.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/provider/theme_provider.dart';

class CustomInputFieldBorder extends HookConsumerWidget {
  final TextEditingController? controller;
  final double? widget;
  final double? height;
  final String? hint;
  final bool obscureText;
  final Color borderColor;
  final double? contentPadding;

  const CustomInputFieldBorder({
    super.key,
    this.controller,
    this.widget,
    this.height,
    this.hint,
    this.obscureText = true,
    this.borderColor = AppColors.colorCDD1DA,  this.contentPadding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeDark = ref.watch(themeNotifier);

    return SizedBox(
      width: widget ?? 250.w,
      height: height ?? 32.h,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: contentPadding ?? 9.w),
          hintStyle: TextStyle(color: AppColors.colorC9CDD4, fontSize: 14.sp,),
          fillColor: themeDark ? AppDarkColors.colorD9FFFFF : Colors.white,
          // 设置背景颜色为白色
          focusedBorder: borderSide(),
          enabledBorder: borderSide(),
          disabledBorder: borderSide(),
          border: borderSide(),
        ),
      ),
    );
  }
  OutlineInputBorder borderSide() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(2), // 圆角边框
      borderSide: BorderSide(
        color: borderColor, // 边框颜色
        width: 1.w, // 边框宽度
      ),
    );
  }
}
