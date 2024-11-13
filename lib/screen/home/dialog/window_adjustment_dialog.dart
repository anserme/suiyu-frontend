import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';
import 'package:fpbrowser/resources/components/custom_button.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:fpbrowser/resources/components/custom_drop_down.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custom_contain_select.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';

class WindowAdjustmentDialog extends HookConsumerWidget {
  const WindowAdjustmentDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectWindowGroup = useState(true);
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            46.w, 26.h, 45.w, 28.h),
        constraints: BoxConstraints.expand(
            width: 590.w, height: 520.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomTextStyle(
                      text: languageService.translate("rearrange_resize", locale: locale),
                      textSize: 18.sp,
                      textColor: AppColors.color181818,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.color888888,
                      size: 25.w,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                SizedBox(width: 16.h,),
                ContainSelectSwitch(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.h),
                    bottomLeft: Radius.circular(2.h),
                  ),
                  text: languageService.translate('grid_sort', locale: locale),
                  colors: selectWindowGroup.value
                      ? [AppColors.colorBE93EA, AppColors.colorA57BF2]
                      : [Colors.white, Colors.white],
                  borderColor: selectWindowGroup.value
                      ? Colors.transparent
                      : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                  textColor: selectWindowGroup.value
                      ? Colors.white
                      : AppColors.colorBE93EA,
                  onTap: () {
                    selectWindowGroup.value = !selectWindowGroup.value;
                  },
                  width: 218.w,
                ),
                ContainSelectSwitch(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2.h),
                    bottomRight: Radius.circular(2.h),
                  ),
                  text: languageService.translate('sort_diagonally', locale: locale),
                  colors: !selectWindowGroup.value
                      ? [AppColors.colorBE93EA, AppColors.colorA57BF2]
                      : [Colors.white, Colors.white],
                  borderColor: !selectWindowGroup.value
                      ? Colors.transparent
                      : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                  textColor: !selectWindowGroup.value
                      ? Colors.white
                      : AppColors.colorBE93EA,
                  onTap: () {
                    selectWindowGroup.value = !selectWindowGroup.value;
                  },

                  width: 218.w,
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              children: [
                SizedBox(width: 31.w,),
                CustomTextStyle(
                  text: languageService.translate('display', locale: locale),
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                  textSize: 14.sp,
                ),
                CustomDropDown(
                  hintText: 'Default（1920*1080）ID：233333333',
                  widget: 406.w,
                ),
              ],
            ),
            SizedBox(height: 14.h,),
            Row(
              children: [
                SizedBox(width: 23.w,),
                CustomTextStyle(
                  text: languageService.translate('initial_value', locale: locale),
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                  textSize: 14.sp,
                ),
                CustomDropDown(
                  hintText: 'X：0',
                  widget:192.w,
                ),
                SizedBox(
                  width: 32.w,
                ),
                CustomDropDown(
                  hintText: 'Y：0',
                  widget:192.w,
                ),
              ],
            ),
            SizedBox(height: 14.h,),
            Row(
              children: [
                SizedBox(width: 15.w,),
                CustomTextStyle(
                  text: languageService.translate('window_size1', locale: locale),
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                  textSize: 14.sp,
                ),
                CustomDropDown(
                  hintText: '${languageService.translate('wide', locale: locale)}0',
                  widget: 120.w,
                ),
                SizedBox(
                  width: 20.w,
                ),
                CustomDropDown(
                  hintText: '${languageService.translate('high', locale: locale)}0',
                  widget: 120.w,
                ),
                SizedBox(
                  width: 20.w,
                ),
                CustomDropDown(
                  hintText: '${languageService.translate('number_windows_per_row', locale: locale)}0',
                  widget: 130.w
                ),
              ],
            ),
            SizedBox(height: 14.h,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                CustomTextStyle(
                  text: languageService.translate('window_spacing', locale: locale),
                  textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                  textSize: 14.sp,
                ),
                SizedBox(
                  width: 6.w,
                ),
                CustomDropDown(
                  hintText: '${languageService.translate('lateral_spacing', locale: locale)}0',
                  widget:192.w,
                ),
                SizedBox(
                  width: 23.w,
                ),
                CustomDropDown(
                  hintText: '${languageService.translate('longitudinal_spacing', locale: locale)}0',
                  widget:192.w,
                ),
              ],
            ),
            SizedBox(height: 14.h,),

            Row(
              children: [
                CustomTextStyle(text: languageService.translate('ordinal_sort', locale: locale), textSize: 14.sp, textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,),
                SizedBox(width: 6.w,),
                ContainSelectSwitch(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.h),
                    bottomLeft: Radius.circular(2.h),
                  ),
                  text: languageService.translate('positive_sequence', locale: locale),
                  colors: selectWindowGroup.value
                      ? [AppColors.colorBE93EA, AppColors.colorA57BF2]
                      : [Colors.white, Colors.white],
                  borderColor: selectWindowGroup.value
                      ? Colors.transparent
                      : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                  textColor: selectWindowGroup.value
                      ? Colors.white
                      : AppColors.colorBE93EA,
                  onTap: () {
                    selectWindowGroup.value = !selectWindowGroup.value;
                  },
                  width: 84.w,
                  height: 32.h,

                ),
                ContainSelectSwitch(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2.h),
                    bottomRight: Radius.circular(2.h),
                  ),
                  text: languageService.translate('antithesis', locale: locale),
                  colors: !selectWindowGroup.value
                      ? [AppColors.colorBE93EA, AppColors.colorA57BF2]
                      : [Colors.white, Colors.white],
                  borderColor: !selectWindowGroup.value
                      ? Colors.transparent
                      : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                  textColor: !selectWindowGroup.value
                      ? Colors.white
                      : AppColors.colorBE93EA,
                  onTap: () {
                    selectWindowGroup.value = !selectWindowGroup.value;
                  },
                  width: 84.w,
                  height: 32.h,
                ),
              ],
            ),
            SizedBox(height: 13.h,),
            Padding(padding: EdgeInsets.only(left: 7.w, ), child: CustomTextStyle(text: "注意:浏览器窗口可缩放的最小宽度为120px，最小高度为40px", textColor: AppColors.colorFF5757,),),
            SizedBox(height: 21.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonGradation(
                  text: languageService.translate(
                      "one_key_adaptive_arrangement",
                      locale: locale),
                  left: 29.w,
                  right: 29.w,
                  top: 11.h,
                  bottom: 11.h,
                ),
                Row(
                  children: [
                    CustomButton(
                      text: languageService.translate('cancel', locale: locale),
                      backgroundColor: AppColors.colorB5A4D7,
                      textColor: Colors.white,
                      fontSize: 16.sp,
                      vertical: 13.h,
                      horizontal: 32.w,
                    ),
                    SizedBox(width: 24.w,),
                    CustomButtonGradation(
                      text: languageService.translate('sure', locale: locale),
                      left: 32.w,
                      right: 32.w,
                      top: 13.h,
                      bottom: 13.h,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
