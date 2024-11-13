import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_assets/app_image_assets.dart';
import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/app_dimens/app_dimens.dart';
import '../../../resources/components/cumstom_text_style.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_drop_down.dart';
import '../../../resources/components/custom_input_border_limit.dart';
import '../../../resources/components/custom_line_text.dart';
import '../../../resources/components/custom_switch.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';


class ExpenseManageStyle1 extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Column(
      children: [
        CustomLineText(textTitle: languageService.translate('basic_setup', locale: locale)),
        CustomContainStyle(
          padding: EdgeInsets.fromLTRB(18.w, 12.h, 81.w, 16.h,),
          margin: EdgeInsets.only(top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextStyle(
                text: languageService.translate("window_name", locale: locale),
                textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                textSize: 14.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomInputBorderLimit(
                widget: double.infinity,
                height: 36.h,
                limit: '0/50',
                hintText: languageService.translate('custom_window_name', locale: locale),
                suffixIconRight: 18.w,
              ),
              // 分组
              SizedBox(height: 12.h,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: languageService.translate("selective_grouping", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
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
                        text: languageService.translate("account_platform", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomDropDown(hintText: languageService.translate('please_select', locale: locale), widget: 620.w, iconSize: 34.w, iconColor: Colors.black,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h,),
              // 账号密码
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: languageService.translate('user_name', locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomInputBorderLimit(
                        widget: 620.w,
                        height: 36.h,
                        limit: '0/100',
                        hintText: languageService.translate('setting_login_name', locale: locale),
                        suffixIconRight: 18.w,
                      )
                    ],
                  ),
                  SizedBox(width: 20.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: languageService.translate("password", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomInputBorderLimit(
                        widget: 620.w,
                        height: 36.h,
                        limit: '0/100',
                        hintText: languageService.translate('setting_login_pwd', locale: locale),
                        suffixIconRight: 18.w,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h,),
              // 触发
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("check_duplicates", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                  SizedBox(width: 9.w,),
                  CustomSwitch(
                    offImage: AppImageAssets.checkBoxUnSelect,
                    onImage: AppImageAssets.checkBoxSelect,
                    width: 16.h,
                    height: 16.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(width: 8.w,),
                  CustomTextStyle(text: languageService.translate("verify_user_name", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                ],
              ),
              SizedBox(height: 12.h,),
              Row(
                children: [
                  CustomTextStyle(text: languageService.translate("multiple_open_settings", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                  SizedBox(width: 23.w,),
                  CustomSwitch(
                    offImage: AppImageAssets.checkBoxUnSelect,
                    onImage: AppImageAssets.checkBoxSelect,
                    width: 16.h,
                    height: 16.h,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(width: 8.w,),
                  CustomTextStyle(text: languageService.translate("not_allow", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
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
                  CustomTextStyle(text: languageService.translate("allow", locale: locale), textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                ],
              ),
              SizedBox(height: 12.h,),
              CustomTextStyle(
                text: languageService.translate("2fa_secret_key", locale: locale),
                textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                textSize: 14.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomInputBorderLimit(
                widget: double.infinity,
                height: 36.h,
                limit: '0/100',
                hintText: languageService.translate('please_input', locale: locale),
                suffixIconRight: 18.w,
              ),
              SizedBox(height: 12.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: languageService.translate("remark", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomInputBorderLimit(
                        widget: 620.w,
                        height: 82.h,
                        minLines: 5,
                        limit: '0/100',
                        hintText: languageService.translate('please_input', locale: locale),
                        suffixIconRight: 18.w,
                      )
                    ],
                  ),
                  SizedBox(width: 8.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 620.w, child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextStyle(
                            text: "Cookie",
                            textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                            textSize: 14.sp,
                          ),
                          CustomButton(
                              text: languageService.translate("add_other_cookie", locale: locale),
                              textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                              horizontal: 11.w,
                              vertical: 1.h,
                              backgroundColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1.withOpacity(0.16)
                          ),
                        ],
                      ),),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomInputBorderLimit(
                        widget: 620.w,
                        height: 82.h,
                        limit: '0/100',
                        hintText: languageService.translate('please_input', locale: locale),
                        minLines: 5,

                        suffixIconRight: 18.w,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h,),
              SizedBox(
                width: 620.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextStyle(
                      text: languageService.translate('open_specified_url', locale: locale),
                      textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      textSize: 14.sp,
                    ),
                    CustomButton(
                        text: languageService.translate("add", locale: locale),
                        horizontal: 12.w,
                        vertical: 2.h,
                        textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                        backgroundColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1.withOpacity(0.16)
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomInputBorderLimit(
                widget: 620.w,
                height: 82.h,
                limit: '0/100',
                hintText: languageService.translate('please_input', locale: locale),
                minLines: 5,
                suffixIconRight: 18.w,
              ),
            ],
          ),
        ),
      ],
    );
  }

}