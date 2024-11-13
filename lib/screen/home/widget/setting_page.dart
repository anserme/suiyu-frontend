import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/app_dimens/app_dimens.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_contain_select.dart';
import '../../../resources/components/custom_input_field_boder.dart';
import '../../../resources/components/custom_redio_button.dart';
import '../../../resources/components/custom_switch.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';
import '../provider/employee_management_provider.dart';
import '../provider/setting_provider.dart';

///
/// 系统设置
///

class SettingPage extends ConsumerWidget {
  final settingSelectTabListProvider = NotifierProvider<SettingSelectTabList, List<SettingSelectTab>>(SettingSelectTabList.new);
  final employeeManagementContentListProvider = NotifierProvider<
      EmployeeManagementContentList,
      List<EmployeeManagementContent>>(EmployeeManagementContentList.new);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        17.w,
        20.h,
        23.w,
        22.h,
      ),
      child: CustomContainStyle(
        padding:
            EdgeInsets.fromLTRB(10.w, 12.h, 26.w, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1062.w,
                  height: 44.h,
                  child: HookConsumer(
                    builder: (context, ref, child) {
                      final todos = ref.watch(settingSelectTabListProvider);
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: todos.length, // 列表项的数量
                        itemBuilder: (context, index) {
                          var model = todos[index];
                          return ContainSelectSwitch(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2.h,),
                              bottomLeft: Radius.circular(2.h,),
                            ),
                            text: model.name,
                            colors: model.isSelect
                                ? [AppColors.colorBE93EA, AppColors.colorA57BF2]
                                : [Colors.white, Colors.white],
                            borderColor: model.isSelect
                                ? Colors.transparent
                                : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                            textColor: model.isSelect
                                ? Colors.white
                                : AppColors.color612CD9,
                            onTap: () {
                              ref
                                  .read(settingSelectTabListProvider.notifier)
                                  .selectItem(id: index);
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: index != todos.length - 1
                                    ? 15.w
                                    : 9.w,
                                vertical: 11.h,),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    CustomButton(
                      text: languageService.translate('restore_default_settings', locale: locale),
                      textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                      horizontal: 22.w,
                      vertical: 9.h,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    CustomButton(
                      text: languageService.translate('reset', locale: locale),
                      textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                      horizontal: 14.w,
                      vertical: 9.h,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    CustomButtonGradation(
                      text: languageService.translate("save_basic_settings", locale: locale),
                      textColor: Colors.white,
                      left: 22.w,
                      right: 22.w,
                      top: 9.h,
                      bottom: 9.h,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 26.h,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      settingInfo(locale, themeDark),
                      windowStyle(locale, themeDark),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [saveOrLoadFile(locale), updateFile(locale)],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [syncWindow(locale, themeDark), browserCache(locale)],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 左边第一个widget
  Widget settingInfo(String locale, bool themeDark) {
    return Expanded(
      child: CustomContainStyle(
        margin: EdgeInsets.only(right: 10.w,),
        padding: EdgeInsets.fromLTRB(0, 20.w, 0, 26.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 109.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextStyle(
                    text: languageService.translate("add_boot", locale: locale),
                    textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                  ),
                  CustomSwitch(
                    width: 35.w,
                    height: 18.h,
                    onChanged: (value) {
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 52.w,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextStyle(
                    text: languageService.translate("minimize_software_opens", locale: locale),
                  ),
                  CustomSwitch(
                    width: 35.w,
                    height: 18.h,
                    onChanged: (value) {
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 13.w
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextStyle(
                    text: languageService.translate("support_google", locale: locale),
                  ),
                  CustomSwitch(
                    width: 35.w,
                    height: 18.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  CustomTextStyle(text: languageService.translate("support_google_tip", locale: locale))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 右边第一个
  Widget windowStyle(String locale, bool themeDark) {
    return Expanded(
      child: CustomContainStyle(
        margin: EdgeInsets.only(left: 10.w,),
        padding:
            EdgeInsets.fromLTRB(19.w, 26.h, 0, 39.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomTextStyle(
                  text: languageService.translate("add_boot", locale: locale),
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                ),
                SizedBox(
                  width: 27.w,
                ),
                CustomTextStyle(
                  text: languageService.translate("normal_open_tip", locale: locale),
                  textColor: AppColors.colorF02A2A,
                  textSize: 12.w,
                ),
              ],
            ),
            SizedBox(
              height: 15.w,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomRadioButton(
                    onChanged: (value) {},
                    isSelect: true
                ),
                CustomTextStyle(
                  text: languageService.translate("normal_open", locale: locale),
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                ),
                SizedBox(
                  width: 17.w,
                ),
                CustomInputFieldBorder(
                  widget: 131.w,
                  height: 28.h,
                  hint: languageService.translate("x_value", locale: locale),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomInputFieldBorder(
                  widget: 131.w,
                  height: 28.h,
                  hint: languageService.translate("y_value", locale: locale),
                ),
                SizedBox(
                  width: 16.h,
                ),
                CustomRadioButton(
                    onChanged: (value) {},
                    isSelect: false
                ),
                SizedBox(
                  width: 5.w,
                ),
                CustomTextStyle(
                  text: languageService.translate("taskbar_minimization", locale: locale),
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                ),
                SizedBox(
                  width: 16.h,
                ),
                CustomRadioButton(onChanged: (value) {}, isSelect: false,),
                SizedBox(
                  width: 5.w,
                ),
                CustomTextStyle(
                  text: languageService.translate("screen_maximization", locale: locale),
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            CustomTextStyle(
              text: languageService.translate("default_upper_left_corner", locale: locale),
              textSize: 12.sp,
              textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
            ),
          ],
        ),
      ),
    );
  }

  /// 左2
  Widget saveOrLoadFile(String locale) {
    return Expanded(
      child: CustomContainStyle(
        margin: EdgeInsets.only(right: 10.w,),
        padding: EdgeInsets.fromLTRB(
            19.w, 26.h, 52.w, 42.h),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextStyle(
                  text: languageService.translate("save_directory", locale: locale),
                ),
                SizedBox(
                  width: 27.w,
                ),
                CustomTextStyle(
                  textSize: 12.sp,
                  textColor: AppColors.colorF02A2A,
                  text: languageService.translate("update_directory_tip", locale: locale),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInputFieldBorder(
                    obscureText: false,
                    widget: 131.w,
                    height: 28.h,
                    hint: "C：\100244\Downloads",
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                CustomButtonGradation(
                  text: languageService.translate("select_directory", locale: locale),
                  left: 11.w,
                  right: 11.w,
                  top: 4.h,
                  bottom: 4.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 右2
  Widget updateFile(String locale) {
    return Expanded(
      child: CustomContainStyle(
        margin: EdgeInsets.only(left: 10.w,),
        padding: EdgeInsets.fromLTRB(
            19.w, 26.h, 52.w, 42.h),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextStyle(
                  text: languageService.translate("update_directory", locale: locale),
                ),
                SizedBox(
                  width: 27.w,
                ),
                CustomTextStyle(
                  textSize: 12.sp,
                  textColor: AppColors.colorF02A2A,
                  text: languageService.translate("update_directory_tip", locale: locale),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInputFieldBorder(
                    widget: 131.w,
                    height: 28.h,
                    hint: "C：\100244\Downloads",
                    obscureText: false,

                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                CustomButtonGradation(
                  text: languageService.translate("select_directory", locale: locale),
                  left: 11.w,
                  right: 11.w,
                  top: 4.h,
                  bottom: 4.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 左3
  Widget syncWindow(String locale, bool themeDark) {
    return Expanded(
      child: CustomContainStyle(
        margin: EdgeInsets.only(right: 10.w,),
        padding:
            EdgeInsets.fromLTRB(19.w, 26.h, 0,41.h,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextStyle(
              text: languageService.translate("synchronous_data", locale: locale),
              textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
              textSize: 14.sp,
            ),
            SizedBox(
              height: 27.w,
            ),
            Row(
              children: [
                CustomSwitch(
                  width: 35.w,
                  height: 18.h,
                  onChanged: (value) {
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomTextStyle(
                  textSize: 12.sp,
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                  text: languageService.translate("synchronous_data_tip", locale: locale),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 右3
  Widget browserCache(String locale) {
    return Expanded(
      child: CustomContainStyle(
        margin: EdgeInsets.only(left: 10.w,),
        padding: EdgeInsets.fromLTRB(
            19.w, 26.h, 52.w, 42.h),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextStyle(
                  text: languageService.translate("browser_cache", locale: locale),
                ),
                SizedBox(
                  width: 27.w,
                ),
                CustomTextStyle(
                  textSize: 12.sp,
                  textColor: AppColors.colorF02A2A,
                  text: languageService.translate("browser_cache_tip", locale: locale),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInputFieldBorder(
                    widget: 131.w,
                    height: 28.h,
                    hint: "C：\100244\Downloads",
                    obscureText: false,

                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                CustomButtonGradation(
                  text: languageService.translate("copy", locale: locale),
                  left: 11.w,
                  right: 11.w,
                  top: 4.h,
                  bottom: 4.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
