import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';

import '../../utils/screen.dart';

enum _ArrowDirection { top, bottom }

///
/// 自定义popup
///
class CustomPopup extends StatelessWidget {
  final GlobalKey? anchorKey;
  final Widget content; // 弹出窗口中的内容
  final Widget child; // 触发弹出窗口的按钮
  final bool isLongPress; // 是否长按触发
  final Color backgroundColor; // 弹出窗口背景颜色
  final Color arrowColor; // 弹出窗口箭头颜色
  final Color? barrierColor; // 遮罩颜色
  final bool showArrow; // 是否显示箭头
  final EdgeInsetsGeometry popupPadding; // popup组件内间距
  final double? displacementOffset; // 重新计算位移偏移量值
  final bool isFixedDisplayRight; // 是否固定在右边显示
  final VoidCallback? selectListClick; // 点击下拉选择回调
  final bool isTop; // 提示是否在文字上方
  final double displacementOffsetLeft; // 左侧的位移

  const CustomPopup({
    this.anchorKey,
    required this.content,
    this.isLongPress = false,
    this.backgroundColor = Colors.transparent,
    this.arrowColor = Colors.white,
    this.barrierColor,
    this.showArrow = true,
    required this.child,
    this.popupPadding = const EdgeInsets.all(0),
    this.displacementOffset,
    this.isFixedDisplayRight = false,
    this.selectListClick,
    this.isTop = false,
    this.displacementOffsetLeft = 0,
  });

  void show(BuildContext context) {
    if (selectListClick != null) {
      selectListClick!();
    }
    final anchor =
        anchorKey?.currentContext ?? context; // 获取 anchorKey 对应的 widget
    final renderBox = anchor.findRenderObject()
        as RenderBox; // 获取 anchorKey 对应 widget 的 RenderBox 对象
    if (renderBox == null) return;
    final offset = renderBox.localToGlobal(
        renderBox.paintBounds.topLeft); // 计算 anchorKey 对应 widget 左上角在屏幕中的位置
    Navigator.of(context).push(_PopupRoute(
      targetRect: offset & renderBox.paintBounds.size,
      backgroundColor: backgroundColor,
      arrowColor: arrowColor,
      showArrow: showArrow,
      barriersColor: barrierColor ?? Colors.black.withOpacity(0.1),
      popupPadding: popupPadding,
      child: content,
      displacementOffset: displacementOffset,
      isFixedDisplayRight: isFixedDisplayRight,
      displacementOffsetLeft: displacementOffsetLeft,
      isTop: isTop,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: isLongPress ? () => show(context) : null,
      onTapUp: !isLongPress ? (_) => show(context) : null,
      child: child,
    );
  }
}

class _PopupContent extends StatelessWidget {
  final Widget child;
  final GlobalKey? childKey;
  final GlobalKey? arrowKey;
  final _ArrowDirection arrowDirection;
  final double? arrowHorizontal;
  final Color backgroundColor;
  final Color arrowColor;
  final bool showArrow;
  final EdgeInsetsGeometry popupPadding;

  const _PopupContent(
      {super.key,
        required this.child,
        this.childKey,
        this.arrowKey,
        this.arrowHorizontal = 0,
        this.showArrow = true,
        this.arrowDirection = _ArrowDirection.top,
        this.backgroundColor = Colors.white,
        this.arrowColor = Colors.white,
        this.popupPadding = EdgeInsets.zero,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          key: childKey,
          padding: popupPadding,
          margin: const EdgeInsets.symmetric(vertical: 10).copyWith(
            top: arrowDirection == _ArrowDirection.bottom ? 0 : null,
            bottom: arrowDirection == _ArrowDirection.top ? 0 : null,
          ),
          constraints: const BoxConstraints(minWidth: 50),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              ),
            ],
          ),
          child: child,
        ),
        Positioned(
          top: arrowDirection == _ArrowDirection.top ? 2 : null,
          bottom: arrowDirection == _ArrowDirection.bottom ? 2 : null,
          left: (250.w - 16.w ) /2,
          child: RotatedBox(
            key: arrowKey,
            quarterTurns: arrowDirection == _ArrowDirection.top ? 2 : 4,
            // 箭头旋转角度
            child: CustomPaint(
              size: showArrow ? const Size(16, 8) : Size.zero,
              painter:
                  _TrianglePainter(color: arrowColor ?? Colors.white), // 箭头绘制器
            ),
          ),
        ),
      ],
    );
  }
}

///
/// 箭头绘制类
///
class _TrianglePainter extends CustomPainter {
  final Color color;

  const _TrianglePainter({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();
    paint.isAntiAlias = true;
    paint.color = color;

    path.lineTo(size.width * 0.66, size.height * 0.86);
    path.cubicTo(size.width * 0.58, size.height * 1.05, size.width * 0.42,
        size.height * 1.05, size.width * 0.34, size.height * 0.86);
    path.cubicTo(size.width * 0.34, size.height * 0.86, 0, 0, 0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.66, size.height * 0.86,
        size.width * 0.66, size.height * 0.86);
    path.cubicTo(size.width * 0.66, size.height * 0.86, size.width * 0.66,
        size.height * 0.86, size.width * 0.66, size.height * 0.86);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

///
/// popup路由
///
class _PopupRoute extends PopupRoute<void> {
  final Rect targetRect; // 弹出窗口相对于屏幕的位置和大小
  final Widget child; // 弹出窗口中的内容

  static const double _margin = 10;
  static final Rect _viewportRect = Rect.fromLTWH(
    _margin,
    screenStatusBar + _margin,
    screenWidth - _margin * 2,
    screenHeight - screenStatusBar - screenBottomBar - _margin * 2,
  );

  final GlobalKey _childKey = GlobalKey();
  final GlobalKey _arrowKey = GlobalKey();
  final Color backgroundColor;
  final Color arrowColor;
  final bool showArrow;
  final Color barriersColor;
  final EdgeInsetsGeometry popupPadding;
  final displacementOffset;
  final isFixedDisplayRight;
  final isTop;
  final double displacementOffsetLeft;

  double _maxHeight = _viewportRect.height;
  _ArrowDirection _arrowDirection = _ArrowDirection.top;
  double _arrowHorizontal = 0;
  double _scaleAlignDx = 0.5;
  double _scaleAlignDy = 0.5;
  double _bottom = 0;
  double _top = 0;
  double _left = 0;
  double _right = 0;

  _PopupRoute({
    RouteSettings? settings,
    ImageFilter? filter,
    required this.child,
    required this.targetRect,
    required this.backgroundColor,
    required this.arrowColor,
    required this.showArrow,
    required this.barriersColor,
    this.popupPadding = EdgeInsets.zero,
    this.displacementOffset,
    this.isFixedDisplayRight,
    this.displacementOffsetLeft = 0,
    this.isTop,
  }) : super(
          settings: settings,
          filter: filter,
        );

  @override
  Color get barrierColor => barriersColor ?? Colors.black.withOpacity(0.1);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => 'Popup';

  @override
  TickerFuture didPush() {
    super.offstage = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final childRect = _getRect(_childKey);
      final arrowRect = _getRect(_arrowKey);
      _calculateArrowOffset(arrowRect!, childRect!);
      _calculateChildOffset(childRect);
      super.offstage = false;
    });
    return super.didPush();
  }

  Rect? _getRect(GlobalKey key) {
    final currentContext = key.currentContext;
    final renderBox = currentContext?.findRenderObject() as RenderBox;
    if (renderBox == null) return null;
    final offset = renderBox.localToGlobal(renderBox.paintBounds.topLeft);
    return offset & renderBox.paintBounds.size;
  }

  // 计算箭头的水平位置
  void _calculateArrowOffset(Rect arrowRect, Rect childRect) {
    var leftEdge = targetRect.center.dx - childRect.center.dx;
    final rightEdge = leftEdge + childRect.width;
    leftEdge = leftEdge < _viewportRect.left ? _viewportRect.left : leftEdge;
    // 如果超过了屏幕，减去多出的部分
    if (rightEdge > _viewportRect.right) {
      leftEdge -= rightEdge - _viewportRect.right;
    }
    final center = targetRect.center.dx - leftEdge - arrowRect.center.dx;
    // 防止箭头超出弹窗的内边距
    if (center + arrowRect.center.dx > childRect.width - 15) {
      _arrowHorizontal = center - 15;
    } else if (center < 15) {
      _arrowHorizontal = 15;
    } else {
      _arrowHorizontal = center;
    }
    _arrowHorizontal = 45;

    _scaleAlignDx = (_arrowHorizontal + arrowRect.center.dx) / childRect.width;
  }

  // 计算弹窗的位置
  void _calculateChildOffset(Rect childRect) {
    final topHeight = targetRect.top - _viewportRect.top;
    final bottomHeight = _viewportRect.bottom - targetRect.bottom;
    final maximum = max(topHeight, bottomHeight);
    _maxHeight = childRect.height > maximum ? maximum : childRect.height;
    if (isTop) {
      _bottom = screenHeight - targetRect.top;
      _arrowDirection = _ArrowDirection.bottom;
      _scaleAlignDy = 1;
    } else {
      if (_maxHeight > bottomHeight) {
        // 在目标上方
        _bottom = screenHeight - targetRect.top;
        _arrowDirection = _ArrowDirection.bottom;
        _scaleAlignDy = 1;
      } else {
        // 在目标下方
        _top = displacementOffset != null
            ? targetRect.bottom - displacementOffset
            : targetRect.bottom;
        print("获取的——top为：$_top");

        _arrowDirection = _ArrowDirection.top;
        _scaleAlignDy = 0;
      }
    }

    // 计算弹窗的水平位置
    final left = targetRect.center.dx - childRect.center.dx;
    final right = left + childRect.width;

    if (true) {
      // 强制性让下拉选项右边居中
      _right = _margin;
      print("强制性让下拉选项右边居中---》$_left,,, $_right");
      return;
    }

    // if (right > _viewportRect.right) {
    //   // 靠右侧
    //   _right = _margin;
    //   print("靠右---》$_right");
    // } else {
    //   // 靠左侧
    //   _left = displacementOffsetLeft != null
    //       ? displacementOffsetLeft
    //       : left < _margin
    //           ? _margin
    //           : left;
    //   print("靠左侧---》$_left,,, ${left < _margin}");
    // }
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return child;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    child = _PopupContent(
      childKey: _childKey,
      arrowKey: _arrowKey,
      arrowHorizontal: _arrowHorizontal,
      arrowDirection: _arrowDirection,
      backgroundColor: backgroundColor,
      arrowColor: arrowColor,
      showArrow: showArrow,
      popupPadding: popupPadding,
      child: child,
    );
    if (!animation.isCompleted) {
      child = FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          alignment: FractionalOffset(_scaleAlignDx, _scaleAlignDy),
          scale: animation,
          child: child,
        ),
      );
    }
    return Stack(
      children: [
        Positioned(
          right: 0,
          top: _top,
          bottom: _bottom,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: _viewportRect.width,
              maxHeight: _maxHeight,
            ),
            child: Material(
              color: Colors.transparent,
              type: MaterialType.transparency,
              child: child,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);
}
