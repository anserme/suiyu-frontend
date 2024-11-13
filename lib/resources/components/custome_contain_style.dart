import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_colors/app_dark_colors.dart';

import '../app_colors/app_colors.dart';
import '../theme/provider/theme_provider.dart';

class CustomContainStyle extends ConsumerWidget {
  final Color? bgColor;
  final double? radius;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;

   const CustomContainStyle({
    super.key,
    this.bgColor,
    this.radius = 5,
    required this.child,
     this.padding,
     this.margin,
     this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeDark = ref.watch(themeNotifier);

    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: width ?? 0, // 如果 width 为 null，则使用 0 作为最小宽度
      ),
        decoration: BoxDecoration(
          color: bgColor ?? (themeDark ? AppDarkColors.colorD9FFFFF : AppColors.colorD9FFFFF),
          borderRadius: BorderRadius.circular(8.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]
        ),
        child: child,
    );
  }
}
