import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/main.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';

import '../app_colors/app_colors.dart';

///
/// 公用的按钮（单背景 + 文字）
///

class CustomButton extends StatelessWidget {
  final String text; // 按钮文字
  final Color backgroundColor; // 按钮背景颜色
  final Color textColor; // 按钮文字颜色
  final double? fontSize; // 按钮字体大小
  final VoidCallback? onPressed; // 点击事件
  final double? radius;
  final double? vertical;
  final double? horizontal;
  final EdgeInsets? margin;
  final List<BoxShadow>? boxShadow;

  const CustomButton({
    Key? key,
    required this.text,
    this.backgroundColor = AppColors.colorE7DAF8,
    this.textColor = AppColors.color6429D1,
    this.fontSize,
    this.onPressed,
    this.radius,
    this.vertical,
    this.horizontal,
    this.margin,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: EdgeInsets.symmetric(vertical: vertical ?? 8.h, horizontal: horizontal ?? 23.w,),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius ?? 4.w),
        boxShadow: boxShadow ?? [],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // 文字颜色
          fontSize: fontSize ?? 14.sp, // 字体大小
        ),
      ),
    );
  }
}

