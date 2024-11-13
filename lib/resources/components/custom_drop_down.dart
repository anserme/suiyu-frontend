import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';

import '../app_colors/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  final double? widget;
  final double? height;
  final String hintText;
  final double? left;
  final double? right;
  final Widget? chideIcon;
  final Widget? child;
  final double? iconSize;
  final Color? iconColor;


  const CustomDropDown({
    super.key,
    this.widget,
    this.height,
    required this.hintText,
    this.left,
    this.right,
    this.chideIcon,
    this.child,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget ?? 250.w,
      height: height ?? 32.h,
      padding:
          EdgeInsets.only(left: left ?? 10.w, right: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.w),
        border: Border.all(color: AppColors.colorCDD1DA, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              hintText,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.colorFF525458,
              ),
            ),
          ),
          child ?? SizedBox(
            width: iconSize ?? 16.h,
            height: iconSize ?? 16.h,
            child: chideIcon ?? Icon(
              Icons.arrow_drop_down,
              color: iconColor ?? AppColors.color8C9298,
              size: iconSize ?? 18.w,
            ),
          ),
        ],
      ),
    );
  }
}
