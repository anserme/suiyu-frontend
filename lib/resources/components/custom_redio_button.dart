import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../app_colors/app_colors.dart';

class CustomRadioButton extends HookWidget {
  final Color? activeColor;
  final bool isSelect;
  final ValueChanged<bool>? onChanged;

  CustomRadioButton({this.activeColor, this.isSelect = false, this.onChanged});


  @override
  Widget build(BuildContext context) {
  final isOn = useState(isSelect);

  return Radio<int>(
        value: 1,
        groupValue: isOn.value  ? 1 : 0,
        activeColor: activeColor ?? AppColors.color612CD9,
        onChanged: (int? value) {
          isOn.value = (value == 1);
          // 调用回调函数，将新状态传递给父组件
          if (onChanged != null) {
            onChanged!(isOn.value);
          }
        }
   );
  }

}