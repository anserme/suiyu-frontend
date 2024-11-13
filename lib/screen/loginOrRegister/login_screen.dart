import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import '../../resources/app_colors/app_dark_colors.dart';
import '../../resources/lations/provider/language_notifier.dart';
import '../../resources/theme/provider/theme_provider.dart';
import 'widget/login_register_widget.dart';
import '../../resources/app_assets/app_image_assets.dart';
import '../../resources/app_colors/app_colors.dart';

import '../../resources/lations/languages.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeDark = ref.watch(themeNotifier);
    String locale = ref.watch(languageProvider).languageCode;

    return DragToMoveArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImageAssets.loginRegisterBg), // 替换为你的图片路径
                  fit: BoxFit.cover, // 填充整个屏幕
                ),
              ),
            ),
            Positioned(
              top: 43.h,
              bottom: 43.h,
              left: 130.w,
              child: SizedBox(
                child: Image.asset(AppImageAssets.loginRegisterIcon),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: 815.w,
                    minWidth: 815.w
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      languageService.translate('login_title', locale: locale),
                      style: TextStyle(
                        color: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        fontSize: 50.sp,
                      ),
                    ),
                    SizedBox(
                      height: 58.h,
                    ),
                    LoginRegisterWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
