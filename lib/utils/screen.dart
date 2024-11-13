import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///设置控件宽度
///
double setWidgetWidth(double width) {
  return ScreenUtil().setWidth(width);
}

///
///设置控件高度
///
double setWidgetHeight(double height) {
  return ScreenUtil().setHeight(height);
}

///
///设置控件字体尺寸
///
double setFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}

/// 获取当前设备的媒体查询数据
MediaQueryData get mediaQuery => MediaQueryData.fromWindow(
  WidgetsBinding.instance.window,
);

/// 获取屏幕宽度
double get screenWidth => mediaQuery.size.width;

/// 获取屏幕高度
double get screenHeight => mediaQuery.size.height;

/// 获取屏幕dp比例
double get screenScale => mediaQuery.devicePixelRatio;

/// 获取顶部安全区域
double get screenStatusBar => mediaQuery.padding.top;

/// 获取底部安全区域
double get screenBottomBar => mediaQuery.padding.bottom;