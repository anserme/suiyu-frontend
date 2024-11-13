import 'package:flutter/cupertino.dart';

///
/// 上部分颜色+ 下部分颜色+下部分阴影的样式
///
class ContainTopBottomColorStyle extends StatelessWidget {
  final double width;
  final double height;
  final double topRadius;
  final Color topColor;
  final double bottomWidth;
  final double bottomHeight;
  final double bottomRadius;
  final Color bottomColor;
  final Color bottomBoxShadow;
  final Widget topWidget;
  final Widget bottomWidget;
  final Alignment topAlignment;
  final Color? backgroundColor1;
  final Color? backgroundColor2;
  final Alignment gradientAlignment;
  final Alignment gradientAlignment2;

  const ContainTopBottomColorStyle(
      {super.key,
      required this.width,
      required this.height,
      required this.topRadius,
      required this.topColor,
      required this.bottomWidth,
      required this.bottomHeight,
      required this.bottomRadius,
      required this.bottomColor,
      required this.bottomBoxShadow,
      required this.topWidget,
      required this.bottomWidget,
      this.topAlignment = Alignment.center,
      this.backgroundColor1,
      this.backgroundColor2,
      this.gradientAlignment = Alignment.centerLeft,
      this.gradientAlignment2 = Alignment.centerRight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          alignment: topAlignment,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                backgroundColor1 ?? topColor,
                backgroundColor2 ?? topColor,
              ],
              begin: gradientAlignment,
              end: gradientAlignment2,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topRadius),
              topRight: Radius.circular(topRadius),
            ),
          ),
          child: topWidget,
        ),
        Container(
          width: bottomWidth,
          height: bottomHeight,
          decoration: BoxDecoration(
              color: bottomColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bottomRadius),
                bottomRight: Radius.circular(bottomRadius),
              ),
              boxShadow: [
                BoxShadow(
                  color: bottomBoxShadow, // 阴影颜色
                  blurRadius: 4, // 模糊半径
                  spreadRadius: 4, // 扩展半径
                  offset: Offset(0, 2), // 阴影偏移
                ),
              ]),
          child: bottomWidget,
        ),
      ],
    );
  }
}
