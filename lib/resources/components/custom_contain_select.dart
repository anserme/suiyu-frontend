import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors/app_colors.dart';
import '../app_dimens/app_dimens.dart';

class ContainSelectSwitch extends StatelessWidget {
  final String text;
  final List<Color> colors;
  final Color borderColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final double? width;
  final Function() onTap;
  final EdgeInsets? padding;
  final double? height;

  const ContainSelectSwitch({
    super.key,
    required this.text,
    required this.colors,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
    required this.borderRadius,
     this.width,
    this.padding, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minWidth: width ?? 0, // 如果 width 为 null，则使用 0 作为最小宽度
        ),
        padding: padding ?? EdgeInsets.zero,
        height: height ?? 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            border: Border.all(
              color: borderColor,
              width: 1.w,
            ),
            borderRadius: borderRadius),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
