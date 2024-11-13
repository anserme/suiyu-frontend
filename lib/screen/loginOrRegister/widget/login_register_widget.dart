import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';
import 'register_page.dart';

import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/lations/languages.dart';
import 'login_page.dart';

class LoginRegisterWidget extends HookConsumerWidget {
   const LoginRegisterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoginSelected = useState(true);
    final bool themeDark = ref.watch(themeNotifier);
    String locale = ref.watch(languageProvider).languageCode;

    return Container(
      margin:  EdgeInsets.fromLTRB(45.w, 19.h, 45.w, 26.h),
      padding:  EdgeInsets.symmetric(horizontal: 46.w),
      constraints: BoxConstraints(
        maxWidth: 520.w,
        minWidth: 520.w,
      ),
      decoration: BoxDecoration(
        color: themeDark ? AppDarkColors.colorD9FFFFF : Colors.white,
        borderRadius: BorderRadius.circular(30.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 19.h,),
          Row(
            children: [
              GestureDetector(
                onTap: () => {isLoginSelected.value = true},
                child: Column(
                  children: [
                    Text(
                      languageService.translate('user_login', locale: locale),
                      style: TextStyle(
                        fontSize: isLoginSelected.value ? 28.sp : 24.sp,
                        color: isLoginSelected.value
                            ? AppColors.colorA57BF2
                            : themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      ),
                    ),
                    if (isLoginSelected.value)
                      Container(
                        padding: EdgeInsets.only(top: 3.h),
                        width: 62.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.colorA57BF2,
                          borderRadius: BorderRadius.circular(3.w),
                        ), // 下划线颜色
                      ),
                  ],
                ),
              ),
              SizedBox(width: 31.w), // 添加间距
              GestureDetector(
                onTap: () => {isLoginSelected.value = false},
                child: Column(
                  children: [
                    Text(
                      languageService.translate('register_now', locale: locale),
                      style: TextStyle(
                        fontSize: !isLoginSelected.value ? 20.sp: 24.sp,
                        color: !isLoginSelected.value
                            ? AppColors.colorA57BF2
                            : themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      ),
                    ),
                    if (!isLoginSelected.value)
                      Container(
                        padding: EdgeInsets.only(top: 3.h),
                        width: 62.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.colorA57BF2,
                          borderRadius: BorderRadius.circular(3.w),
                        ), // 下划线颜色
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h,),
          isLoginSelected.value ?  const LoginPage() :  const RegisterWidget()
        ],
      ),
    );
  }
}