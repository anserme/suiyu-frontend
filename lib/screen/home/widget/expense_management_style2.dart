import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';
import 'package:fpbrowser/resources/components/custom_drop_down.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custom_line_text.dart';
import '../../../resources/components/custom_switch.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';

///
/// 设计图倒数第3个
///

class ExpenseManagementStyle2 extends ConsumerWidget {
  const ExpenseManagementStyle2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Column(
      children: [
        CustomLineText(textTitle: languageService.translate("proxy_setup", locale: locale)),
        SizedBox(height: 8.h),
        CustomContainStyle(
          padding: EdgeInsets.fromLTRB(18.w, 12.h, 81.w, 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomTextStyle(
                      text: languageService.translate("proxy_way",
                          locale: locale),
                      textSize: 14.sp,
                      textColor: themeDark
                          ? AppDarkColors.color333333
                          : AppColors.color333333,
                      isBold: true),
                  SizedBox(width: 16.h,),
                  CustomSwitch(
                    offImage: AppImageAssets.checkBoxUnSelect,
                    onImage: AppImageAssets.checkBoxSelect,
                    width: 16.h,
                    height: 16.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(width: 8.w,),
                  CustomTextStyle(
                    text: languageService.translate("custom_proxy",
                        locale: locale),
                    textSize: 14.sp,
                    textColor: themeDark
                        ? AppDarkColors.color333333
                        : AppColors.color333333,
                  ),
                  SizedBox(width: 19.w,),
                  CustomSwitch(
                    offImage: AppImageAssets.checkBoxUnSelect,
                    onImage: AppImageAssets.checkBoxSelect,
                    width: 16.h,
                    height: 16.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(width: 8.w,),
                  CustomTextStyle(
                    text: languageService.translate("custom_proxy_tip",
                        locale: locale),
                    textSize: 14.sp,
                    textColor: themeDark
                        ? AppDarkColors.color333333
                        : AppColors.color333333,
                  ),
                  SizedBox(width: 20.w,),
                  CustomSwitch(
                    offImage: AppImageAssets.checkBoxUnSelect,
                    onImage: AppImageAssets.checkBoxSelect,
                    width: 16.h,
                    height: 16.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(width: 8.w,),
                  CustomTextStyle(
                    text: languageService.translate("proxy_ip_manage",
                        locale: locale),
                    textSize: 14.sp,
                    textColor: themeDark
                        ? AppDarkColors.color333333
                        : AppColors.color333333,
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                          text: languageService.translate("ip_query_channel",
                              locale: locale),
                          textSize: 14.sp,
                          textColor: themeDark
                              ? AppDarkColors.color333333
                              : AppColors.color333333,
                          isBold: true),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomDropDown(
                        hintText: languageService.translate('please_select',
                            locale: locale),
                        widget: 620.w,
                        iconSize: 34.w,
                        iconColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: languageService.translate("agent_type", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                        isBold: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomDropDown(
                        hintText: languageService.translate('please_select',
                            locale: locale),
                        widget: 620.w,
                        iconSize: 34.w,
                        iconColor: Colors.black,
                      ),
                    ],
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
