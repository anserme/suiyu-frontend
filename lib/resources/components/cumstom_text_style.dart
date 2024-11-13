import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';

/// 文本框通用样式
///
///
class CustomTextStyle extends StatelessWidget {
  final Color? textColor; // 文本颜色
  final double? textSize; // 文本颜色
  final bool? isBold; // 是否加粗
  final String text; // 文本内容

  const CustomTextStyle(
      {super.key,
      this.textColor,
      this.textSize,
      this.isBold,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? AppColors.color161E36,
        fontSize: textSize ?? 16.sp,
        fontWeight: (isBold ?? false) ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
