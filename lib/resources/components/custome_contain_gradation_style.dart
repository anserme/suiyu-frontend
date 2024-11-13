import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';
import '../app_dimens/app_dimens.dart';

///  渐变+阴影
class CustomContainGradationStyle extends StatelessWidget {
  final Color? bgColor;
  final Color backgroundColor1;
  final Color backgroundColor2;

  final double? radius;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment begin;
  final Alignment end;
  final Color boxShadowColors;


  const CustomContainGradationStyle({
    super.key,
    this.bgColor,
    this.radius = 5,
    required this.child,
     this.padding,
     this.margin,
     this.backgroundColor1 = AppColors.colorE6DCFF,
     this.backgroundColor2 = AppColors.colorC2FFFFFF,
    this.begin = Alignment.topCenter,
    this.end= Alignment.bottomCenter,
    this.boxShadowColors = AppColors.color0F820D93,

  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.colorD9FFFFF,
            gradient: LinearGradient(
              colors: [
                backgroundColor1,
                backgroundColor2,
              ],
              begin: begin,
              end: end,
            ),
            borderRadius: BorderRadius.circular(radius ?? 5.w),
            boxShadow: [
              BoxShadow(
                color: boxShadowColors,
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: child,
    );
  }
}
