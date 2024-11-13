import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';

class CustomSwitch extends HookWidget {
  final String onImage;
  final String offImage;
  final double? width;
  final double? height;
  final bool isOpen;
  final ValueChanged<bool>? onChanged;

  const CustomSwitch({super.key,
    this.onImage = AppImageAssets.iconOpenSwitch,
    this.offImage = AppImageAssets.iconCloseSwitch,
    this.onChanged,
    this.width,
    this.height,
    this.isOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    final isOn = useState(isOpen);

    return GestureDetector(
      onTap: () {
        // 切换开关状态
        isOn.value = !isOn.value;
        // 调用回调函数，将新状态传递给父组件
        if (onChanged != null) {
          onChanged!(isOn.value);
        }
      },
      child: Padding(padding: EdgeInsets.all(5.h), child: Image.asset(
        isOn.value ? onImage : offImage,
        width: width ?? 28.w,
        height: height ?? 16.h,
      ), ),
    );
  }
}