import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:fpbrowser/resources/components/custom_drop_down.dart';
import 'package:fpbrowser/resources/components/custom_input_field_boder.dart';
import 'package:fpbrowser/screen/home/provider/exployee_management_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custom_contain_select.dart';
import '../../../resources/components/custom_line_text.dart';
import '../../../resources/components/custom_switch.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';

///
/// 设计图倒数第3个
///

final browserWindowSelectListProvider = NotifierProvider<ExpenseManageSelectList, List<ExpenseManageSelect>>(ExpenseManageSelectList.new);
final selectWindowGroup = useState(true);
final deviceListProvider = NotifierProvider<ExpenseManageDeviceSelectList, List<ExpenseManageDeviceSelect>>(ExpenseManageDeviceSelectList.new);
final rtcListProvider = NotifierProvider<ExpenseManageRTCSelectList, List<ExpenseManageRTCSelect>>(ExpenseManageRTCSelectList.new);

class ExpenseManagementStyle5 extends HookConsumerWidget {
  const ExpenseManagementStyle5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final selectType = useState(0);
    final selectType2 = useState(0);
    final selectType3 = useState(0);
    final selectType4 = useState(0);
    final selectType5 = useState(0);
    final bool themeDark = ref.watch(themeNotifier);


    return Column(
      children: [
        CustomLineText(textTitle: languageService.translate("fingerprint_setting", locale: locale)),
        SizedBox(height: 8.h),
        CustomContainStyle(
          padding: EdgeInsets.fromLTRB(18.w, 20.h,
              82.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextStyle(text: languageService.translate("chrome", locale: locale), textSize: 14.sp, textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, isBold: true),
              SizedBox(height: 14.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("browser_kernel_version", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp, isBold: true),
                  SizedBox(width: 350.w,),
                  CustomTextStyle(text: languageService.translate("browser_kernel_version_tip", locale: locale),textSize: 14.sp, textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, isBold: true,),
                ],
              ),
              SizedBox(height: 14.h,),
              CustomTextStyle(text: languageService.translate("devices", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp, isBold: true),
              SizedBox(height: 7.h,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: languageService.translate("operating_system_version", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                        isBold: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomDropDown(hintText: languageService.translate('please_select', locale: locale), widget: 620.w, iconSize: 34.w, iconColor: Colors.black,),
                    ],
                  ),
                  SizedBox(width: 20.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: languageService.translate("browser_version", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                        isBold: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomDropDown(hintText: languageService.translate('please_select', locale: locale), widget: 620.w, iconSize: 34.w, iconColor: Colors.black,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomTextStyle(
                    text: "User Agent",
                    textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                    textSize: 14.sp,
                  ),
                  CustomButtonGradation(
                      text: languageService.translate("refresh", locale: locale),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomInputFieldBorder(
                widget: double.infinity,
                height: 36.h,
                hint: "--",
              ),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("language", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,isBold: true,),
                  SizedBox(width: 45.w,),
                  CustomSwitch(
                    width: 27.w,
                    height: 14.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(width: 15.w,),
                  CustomTextStyle(text: languageService.translate("language_tip", locale: locale), textColor: AppColors.color666666, textSize: 14.sp,),
                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("interface_language", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,isBold: true,),
                  SizedBox(width: 17.w,),
                  CustomSwitch(
                    width: 27.w,
                    height: 14.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(width: 15.w,),
                  CustomTextStyle(text: languageService.translate("interface_language_tip", locale: locale), textColor: AppColors.color666666, textSize: 14.sp,),
                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("time_zone", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,isBold: true,),
                  SizedBox(width: 45.w,),
                  CustomSwitch(
                    width: 27.w,
                    height: 14.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(width: 15.w,),
                  CustomTextStyle(text: languageService.translate("time_zone_tip", locale: locale), textColor: AppColors.color666666, textSize: 14.sp,),
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  CustomTextStyle(text: "Web RTC", textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp, isBold: true,),
                  SizedBox(width: 10.w,),
                  SizedBox(width: 250.w, height: 24.h, child: HookConsumer(
                    builder: (context, ref, child) {
                      final rtcTodos = ref.watch(rtcListProvider);
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: rtcTodos.length, // 列表项的数量
                        itemBuilder: (context, index) {
                          var model = rtcTodos[index];
                          return ContainSelectSwitch(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2.h),
                              bottomLeft: Radius.circular(2.h),
                            ),
                            text: model.name,
                            colors: model.isSelect
                                ? [
                              AppColors.colorBE93EA,
                              AppColors.colorA57BF2
                            ]
                                : [Colors.white, Colors.white],
                            borderColor: model.isSelect
                                ? Colors.transparent
                                : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                            textColor: model.isSelect
                                ? Colors.white
                                : AppColors.color612CD9,
                            onTap: () {
                              ref.read(rtcListProvider.notifier).selectItem(id: index);
                            },
                            width: 62.w,
                            height: 24.h,

                          );
                        },
                      );
                    },
                  ),),
                  SizedBox(width: 8.w,),
                  CustomTextStyle(text: languageService.translate("web_rtc_tip", locale: locale), textColor: AppColors.color666666, textSize: 14.sp,),
                ],
              ),
              SizedBox(height: 14.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("window_size", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,isBold: true,),
                  SizedBox(width: 17.w,),
                  CustomInputFieldBorder(
                    borderColor: AppColors.colorBE93EA,
                    hint: "1280",
                    widget: 64.w,
                    contentPadding: 15.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 17.w,),
                  CustomTextStyle(text: "X", textColor: AppColors.color666666, textSize: 14.sp,),
                  SizedBox(width: 17.w,),
                  CustomInputFieldBorder(
                    borderColor: AppColors.colorBE93EA,
                    hint: "720",
                    widget: 64.w,
                    contentPadding: 17.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 8.w,),
                  CustomTextStyle(text: languageService.translate("window_size_tip", locale: locale), textColor: AppColors.color666666, textSize: 14.sp,),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("resolution", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                  SizedBox(width: 71.w,),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("follow_computer", locale: locale),
                    colors: selectType.value == 0
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType.value == 0
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType.value == 0
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType.value = 0;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("custom", locale: locale),
                    colors: selectType.value == 1
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType.value == 1
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType.value == 1
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType.value = 1;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("random", locale: locale),
                    colors: selectType.value == 2
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType.value == 2
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType.value == 2
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType.value = 2;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("font", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                  SizedBox(width: 71.w,),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("system_default", locale: locale),
                    colors: selectType2.value == 0
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType2.value == 0
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType2.value == 0
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType2.value = 0;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("custom", locale: locale),
                    colors: selectType2.value == 1
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType2.value == 1
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType2.value == 1
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType2.value = 1;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("随机匹配", locale: locale),
                    colors: selectType2.value == 2
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType2.value == 2
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType2.value == 2
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType2.value = 2;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                ],
              ),

              SizedBox(height: 16.h,),
              Row(
            children: [
              CustomTextStyle(text: "Canvas", textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
              SizedBox(width: 71.w,),
              ContainSelectSwitch(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.h),
                  bottomLeft: Radius.circular(2.h),
                ),
                text: languageService.translate("random", locale: locale),
                colors: selectType3.value == 0
                    ? [
                  AppColors.colorBE93EA,
                  AppColors.colorA57BF2
                ]
                    : [Colors.white, Colors.white],
                borderColor: selectType3.value == 0
                    ? Colors.transparent
                    : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                textColor: selectType3.value == 0
                    ? Colors.white
                    : AppColors.color612CD9,
                onTap: () {
                  selectType3.value = 0;
                },
                width: 62.w,
                height: 24.h,

              ),
              ContainSelectSwitch(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.h),
                  bottomLeft: Radius.circular(2.h),
                ),
                text: languageService.translate("close", locale: locale),
                colors: selectType3.value == 1
                    ? [
                  AppColors.colorBE93EA,
                  AppColors.colorA57BF2
                ]
                    : [Colors.white, Colors.white],
                borderColor: selectType3.value == 1
                    ? Colors.transparent
                    : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                textColor: selectType3.value == 1
                    ? Colors.white
                    : AppColors.color612CD9,
                onTap: () {
                  selectType3.value = 1;
                },
                width: 62.w,
                height: 24.h,

              ),
              SizedBox(width: 13.w),
              CustomTextStyle(text: languageService.translate("canvas_tip", locale: locale), textColor: AppColors.color666666, textSize: 14.sp,),
            ],
          ),

              SizedBox(height: 16.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("web_gl_image", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                  SizedBox(width: 71.w,),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("random", locale: locale),
                    colors: selectType4.value == 0
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType4.value == 0
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType4.value == 0
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType4.value = 0;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("close", locale: locale),
                    colors: selectType4.value == 1
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType4.value == 1
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType4.value == 1
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType4.value = 1;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                  SizedBox(width: 13.w),
                  CustomTextStyle(text: languageService.translate("web_gl_image_tip", locale: locale), textColor: AppColors.color666666, textSize: 14.sp,),
                ],
              ),

              SizedBox(height: 16.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("web_gl_metadata", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                  SizedBox(width: 71.w,),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("custom", locale: locale),
                    colors: selectType5.value == 0
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType5.value == 0
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType5.value == 0
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType5.value = 0;
                    },
                    width: 62.w,
                    height: 24.h,

                  ),
                  ContainSelectSwitch(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      bottomLeft: Radius.circular(2.h),
                    ),
                    text: languageService.translate("close", locale: locale),
                    colors: selectType5.value == 1
                        ? [
                      AppColors.colorBE93EA,
                      AppColors.colorA57BF2
                    ]
                        : [Colors.white, Colors.white],
                    borderColor: selectType5.value == 1
                        ? Colors.transparent
                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textColor: selectType5.value == 1
                        ? Colors.white
                        : AppColors.color612CD9,
                    onTap: () {
                      selectType5.value = 1;
                    },
                    width: 62.w,
                    height: 24.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
