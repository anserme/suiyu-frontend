import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';

class SearchInputWidget extends StatelessWidget {
  final double? widget;
  final double? height;
  final String? hint;
  final TextEditingController? controller; // 新增 controller 参数

  const SearchInputWidget(
      {super.key, this.widget, this.height, this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget ?? 250.w,
      height: height ?? 32.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.w),
        border: Border.all(
          color: AppColors.colorCDD1DA, // 边框颜色
          width: 1.w, // 边框宽度
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 9.w, right: 5.w,),
            child: Image.asset(
              AppImageAssets.iconSearch,
              width: 15.w,
              height: 15.w,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                  fontSize: 14.sp, color: AppColors.color333333),
              decoration: InputDecoration(
                hintText: hint ?? '请输入',
                hintStyle: TextStyle(
                    fontSize: 14.sp, color: AppColors.color6F737B),
                border: InputBorder.none, // 无边框
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
