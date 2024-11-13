import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';

import '../app_colors/app_colors.dart';

///
/// 公用的按钮（单背景 + 文字）
///

class CustomButtonGradation extends StatelessWidget {
  final String text; // 按钮文字
  final Color backgroundColor1; // 按钮背景颜色
  final Color backgroundColor2; // 按钮背景颜色
  final Color textColor; // 按钮文字颜色
  final double? fontSize; // 按钮字体大小
  final VoidCallback? onPressed; // 点击事件
  final double? radius;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final EdgeInsets? margin;
  final String? iconPath;
  final double? iconWidth;
  final double? iconHeight;
  final Widget? isIcon;
  final bool isShowIcon;
  final Widget? child;
  final Color? shadowColor;


  const CustomButtonGradation({
    super.key,
    required this.text,
    this.backgroundColor1 = AppColors.colorBE93EA,
    this.backgroundColor2 = AppColors.colorA57BF2,
    this.textColor = Colors.white,
    this.fontSize,
    this.onPressed,
    this.radius,
    this.margin,
    this.iconPath,
    this.iconWidth,
    this.iconHeight,
    this.isIcon,
    this.isShowIcon = false,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.child, this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: EdgeInsets.fromLTRB(
        left ?? 14.w,
        top ?? 5.h,
        right ?? 14.w,
        bottom ?? 5.h,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundColor1,
              backgroundColor1,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(radius ?? 4.w),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? Colors.transparent,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      child: child ?? (!isShowIcon
          ? Text(
              text,
              style: TextStyle(
                color: textColor, // 文字颜色
                fontSize: fontSize ?? 14.sp, // 字体大小
              ),
            )
          : Row(
              children: [
                isIcon != null
                    ? isIcon!
                    : Image.asset(
                        iconPath!,
                        width: iconWidth ?? 16.h,
                        height: iconHeight ?? 16.h,
                      ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor, // 文字颜色
                    fontSize: fontSize ?? 14.sp, // 字体大小
                  ),
                ),
              ],
            )),
    );
  }
}
