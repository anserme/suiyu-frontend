import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';
import '../app_dimens/app_dimens.dart';

/// 左边文字+右侧图标
class CustomTextAndIconRight extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final bool? isFontBold;
  final double? padding;
  final IconData? iconData;
  final double? iconSize;
  final Color? iconColor;

  const CustomTextAndIconRight(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontColor,
      this.isFontBold,
      this.padding,
      this.iconData,
      this.iconSize,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize ?? 14.sp,
              color: fontColor ?? AppColors.color101216,
              fontWeight: (isFontBold ?? true) ? FontWeight.bold : FontWeight.normal),
        ),
        SizedBox(
          width: padding ?? 5.w,
        ),
        Icon(
         iconData ?? Icons.arrow_upward,
          size: iconSize ?? 18.w,
          color: iconColor ?? AppColors.color333333,
        ),
      ],
    );
  }
}
