import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_colors/app_colors.dart';
import '../app_colors/app_dark_colors.dart';
import '../theme/provider/theme_provider.dart';

///
/// 输入框，带限制字数
///
class CustomInputBorderLimit extends ConsumerWidget {
  final double height;
  final String limit;
  final String hintText;
  final double suffixIconRight;
  final double widget;
  final int minLines;
  final TextEditingController? controller; // 新增 controller 参数
  const CustomInputBorderLimit(
      {super.key,
      required this.height,
      required this.limit,
      this.controller,
        required this.hintText,
        required this.suffixIconRight, required this.widget,  this.minLines = 1});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeDark = ref.watch(themeNotifier);

    return SizedBox(
      width: widget,
      height: height,
      child: TextField(
        controller: controller,
        maxLines: null, // 设置为 null 使其高度自适应
        minLines: minLines,    // 初始高度为 5 行
        decoration: InputDecoration(
          filled: true, // 启用背景颜色
          fillColor: Colors.white, // 设置背景颜色
          suffixIcon: Container(
            width: 78.w,
            padding: EdgeInsets.only(right: suffixIconRight, bottom: 6.h),
            child: Align(alignment: Alignment.bottomRight, child: CustomTextStyle(text: limit),),
          ),
          border: borderSide(),
          focusedBorder: borderSide(),
          enabledBorder: borderSide(),
          disabledBorder: borderSide(),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.colorC9CDD4,
          ),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
        ),
        style: TextStyle(
          fontSize: 14.sp,
          color: themeDark ? AppDarkColors.color333333: AppColors.color333333,
        ),
        // onChanged: (String? value) =>
        //     controller.onChangePort(value),
      ),
    );
  }

  OutlineInputBorder borderSide() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(2.w), // 圆角边框
      borderSide: BorderSide(
        color: AppColors.colorCDD1DA, // 边框颜色
        width: 1.w, // 边框宽度
      ),
    );
  }
}
