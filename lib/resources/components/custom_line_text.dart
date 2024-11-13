import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';
import '../app_dimens/app_dimens.dart';
import 'cumstom_text_style.dart';

class CustomLineText extends StatelessWidget {
  final String textTitle;

  const CustomLineText({super.key, required this.textTitle});
  @override
  Widget build(BuildContext context) {
    return title(textTitle);
  }

  Widget title(String title) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: AppColors.color6429D1,
            borderRadius: BorderRadius.circular(2.w),
          ),
        ),
        SizedBox(
          width: 7.w,
        ),
        CustomTextStyle(
          text: title,
          textSize: 16.sp,
          textColor: AppColors.color6429D1,
        ),
      ],
    );
  }
}