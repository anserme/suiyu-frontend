import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custom_input_border_limit.dart';
import '../../../resources/components/custom_line_text.dart';
import '../../../resources/components/custom_switch.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';

///
/// 设计图倒数第3个
///

class ExpenseManagementStyle3 extends ConsumerWidget {
  const ExpenseManagementStyle3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Column(
      children: [
        CustomLineText(
            textTitle:
                languageService.translate("common_settings", locale: locale)),
        SizedBox(height: 8.h),
        CustomContainStyle(
          padding: EdgeInsets.fromLTRB(18.w, 20.h, 5.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomTextStyle(
                      text: languageService.translate(
                          "browser_window_workbench_page",
                          locale: locale),
                      textSize: 14.sp,
                      textColor: themeDark
                          ? AppDarkColors.color333333
                          : AppColors.color333333,
                      isBold: true),
                  SizedBox(width: 13.w),
                  CustomSwitch(
                    offImage: AppImageAssets.checkBoxUnSelect,
                    onImage: AppImageAssets.checkBoxSelect,
                    width: 16.h,
                    height: 16.h,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CustomTextStyle(
                    text:
                        languageService.translate("local_page", locale: locale),
                    textSize: 14.sp,
                    textColor: themeDark
                        ? AppDarkColors.color333333
                        : AppColors.color333333,
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  CustomSwitch(
                    offImage: AppImageAssets.checkBoxUnSelect,
                    onImage: AppImageAssets.checkBoxSelect,
                    width: 16.h,
                    height: 16.h,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CustomTextStyle(
                    text: languageService.translate("not_show", locale: locale),
                    textSize: 14.sp,
                    textColor: themeDark
                        ? AppDarkColors.color333333
                        : AppColors.color333333,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomTextStyle(
                    text: languageService.translate("not_show_tip",
                        locale: locale),
                    textSize: 14.sp,
                    textColor: themeDark
                        ? AppDarkColors.color333333
                        : AppColors.color333333,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomTextStyle(
                      text: languageService.translate("disable_image_loading",
                          locale: locale),
                      textColor: themeDark
                          ? AppDarkColors.color333333
                          : AppColors.color333333,
                      textSize: 14.sp,
                      isBold: true),
                  SizedBox(
                    width: 45.w,
                  ),
                  CustomSwitch(
                    width: 30.w,
                    height: 14.h,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomTextStyle(
                    text: languageService.translate("disable_loading",
                        locale: locale),
                    textSize: 14.sp,
                    textColor: themeDark
                        ? AppDarkColors.color333333
                        : AppColors.color333333,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomInputBorderLimit(
                      height: 30.h,
                      limit: "kb",
                      hintText: "0",
                      suffixIconRight: 7.w,
                      widget: 88.w),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomTextStyle(
                    text: languageService.translate("disable_loading_tip",
                        locale: locale),
                    textColor: AppColors.color666666,
                    textSize: 14.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  CustomTextStyle(
                      text: languageService.translate("allow_login_chrome",
                          locale: locale),
                      textColor: themeDark
                          ? AppDarkColors.color333333
                          : AppColors.color333333,
                      textSize: 14.sp,
                      isBold: true),
                  SizedBox(
                    width: 21.w,
                  ),
                  CustomSwitch(
                    width: 30.w,
                    height: 14.h,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  CustomTextStyle(
                    text: languageService.translate("allow_login_chrome_tip",
                        locale: locale),
                    textColor: AppColors.color666666,
                    textSize: 14.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  CustomTextStyle(
                      text: languageService.translate(
                          "use_hardware_acceleration_mode",
                          locale: locale),
                      textColor: themeDark
                          ? AppDarkColors.color333333
                          : AppColors.color333333,
                      textSize: 14.sp,
                      isBold: true),
                  SizedBox(
                    width: 17.w,
                  ),
                  CustomSwitch(
                    width: 30.w,
                    height: 14.h,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  CustomTextStyle(
                    text: languageService.translate(
                        "use_hardware_acceleration_mode_tip",
                        locale: locale),
                    textColor: AppColors.color666666,
                    textSize: 14.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  CustomTextStyle(
                      text: languageService.translate("provincial_storage_mode",
                          locale: locale),
                      textColor: themeDark
                          ? AppDarkColors.color333333
                          : AppColors.color333333,
                      textSize: 14.sp,
                      isBold: true),
                  SizedBox(
                    width: 59.w,
                  ),
                  CustomSwitch(
                    width: 30.w,
                    height: 14.h,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  CustomTextStyle(
                    text: languageService.translate(
                        "provincial_storage_mode_tip",
                        locale: locale),
                    textColor: AppColors.color666666,
                    textSize: 14.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
