import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_assets/app_image_assets.dart';
import '../app_colors/app_colors.dart';

/// 列表右下角试图
class CustomListBottom extends HookWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("共48条", style: TextStyle(color: AppColors.color101216, fontSize: 14.sp),),
        SizedBox(width: 8.w,),
        Container(
          width: 88.w,
          height: 30.h,
          padding: EdgeInsets.only(left: 8.w, right: 4.w),
          decoration: BoxDecoration(
            color: AppColors.colorF2F3F5,
            borderRadius: BorderRadius.circular(2.w),
          ),
          child: Row(
            children: [
              Text("10条/页", style: TextStyle(color: AppColors.color101216, fontSize: 14.sp),),
              SizedBox(width: 10.w,),
              SizedBox(
                width: 14.w,
                height: 14.w,
                child: Icon(Icons.arrow_drop_down, color: AppColors.color404756, size: 14.sp,),
              ),
            ],
          ),
        ),
        Image.asset(AppImageAssets.iconHomeLeft, width: 16.h, height: 16.h,),
        Text("1", style: TextStyle(color: AppColors.color101216, fontSize: 14.sp), textAlign: TextAlign.center,),
        SizedBox(width: 20.w),
        Text("2", style: TextStyle(color: AppColors.color101216, fontSize: 14.sp),textAlign: TextAlign.center),
        SizedBox(width: 20.w),
        Text("3", style: TextStyle(color: AppColors.color101216, fontSize: 14.sp),textAlign: TextAlign.center),
        SizedBox(width: 20.w),
        Image.asset(AppImageAssets.iconHomeRight, width: 16.h, height: 16.h,),
        SizedBox(width: 24.w,),
        Text("跳至", style: TextStyle(color: AppColors.color101216, fontSize: 14.sp),),
        SizedBox(width: 4.w,),
        Container(
          width: 48.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: AppColors.colorF2F3F5,
            borderRadius: BorderRadius.circular(2.w),
          ),
          child: TextField(
            style: TextStyle(fontSize: 14.sp, color: AppColors.color101216),
            decoration: InputDecoration(
              hintText: '',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 5.w),
            ),
            onSubmitted: (value) {

            },
          ),
        ),

      ],
    );
  }}