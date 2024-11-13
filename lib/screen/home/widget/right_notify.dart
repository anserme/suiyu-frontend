import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';

import '../../../resources/app_assets/app_image_assets.dart';
import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';

class RightNotifyWidget extends ConsumerWidget {
  const RightNotifyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Container(
      margin: EdgeInsets.only(left: 13.w, right: 25.w),
      padding: EdgeInsets.fromLTRB(36.w, 13.h, 16.w, 13.h),
      color: themeDark ? Colors.black : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(AppImageAssets.homeNotifity, width: 20.w, height: 23.h,),
              SizedBox(width: 6.w,),
              Text("云手机全新上线，欢迎体验！！！", style: TextStyle(color: AppColors.colorE72915, fontSize: 16.sp),),
            ],
          ),
          Row(
            children: [
              CustomButton(text: languageService.translate('contact_us', locale: locale)),
              SizedBox(width: 12.w,),
              CustomButton(text: languageService.translate('official_website', locale: locale,), ),
              SizedBox(width: 15.w,),
              Image.asset(AppImageAssets.homeAccount, width: 22.w, height: 22.h,),
              SizedBox(width: 7.w,),
              Container(
                height: 20.h,
                decoration: BoxDecoration(
                    color: AppColors.colorE7DAF8,
                    borderRadius: BorderRadius.circular(4.w)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 3.w,),
                    Text(
                      'chytest',
                      style: TextStyle(
                        color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1, // 文字颜色
                        fontSize: 12.sp, // 字体大小
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                      size: 15.w,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}