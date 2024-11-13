import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/theme/provider/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custom_switch.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';


class RightTopWidget extends ConsumerWidget {
  const RightTopWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeDark = ref.watch(themeNotifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomSwitch(
              isOpen: ref.read(themeNotifier),
              onChanged: (value) {
                if (ref.watch(themeNotifier) == true) { // 夜间模式
                  ref.read(themeNotifier.notifier).setDark(false);
                } else {
                  ref.read(themeNotifier.notifier).setDark(true);
                }
              },
            ),
            SizedBox(
              width: 11.w,
            ),
            Image.asset(
              AppImageAssets.iconHomeServices,
              width: 20.w,
              height: 21.h,
            ),
            SizedBox(
              width: 7.w,
            ),
            SizedBox(
              height: 20.h,
              child: VerticalDivider(color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1, thickness: 1.h,),
            ),
            SizedBox(
              width: 10.w,
            ),
            Image.asset(
              AppImageAssets.iconHomeLanague,
              width: 18.w,
              height: 18.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              ref.read(languageProvider).languageCode == "zh" ? languageService.translate('simplified_chinese') : "English",
              style: TextStyle(fontSize: 20.sp, color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1),
            ),
            IconButton(
              onPressed: () {
                if (ref.watch(languageProvider).languageCode == "en") {
                  ref.read(languageProvider.notifier).setLocale(const Locale('zh'));
                } else {
                  ref.read(languageProvider.notifier).setLocale(const Locale('en'));
                }
              },
              icon: Icon(
                Icons.arrow_drop_down,
                color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
              ),
            ),
            SizedBox(width: 11.w,),
            InkWell(
              onTap: () async {
                await windowManager.minimize();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 6.h,
                ),
                child: Image.asset(
                  AppImageAssets.iconHomeTopMinification,
                  width: 14.w,
                  height: 2.h,
                ),
              ),
            ),
            SizedBox(
              width: 7.w,
            ),
            InkWell(
              onTap: () async {
                bool currentMaximized = await windowManager.isMaximized();
                if (!currentMaximized) {
                  await windowManager.maximize();
                } else {
                 await windowManager.unmaximize();
                }
              },
              child: Image.asset(
                AppImageAssets.iconHomeBlowUp,
                width: 14.w,
                height: 14.w,
              ),
            ),
            SizedBox(
              width: 7.w,
            ),
            InkWell(
              onTap: () async {
                await  windowManager.close();
              },
              child: Image.asset(
                AppImageAssets.iconHomeClose,
                width: 14.w,
                height: 14.w,
              ),
            ),
            SizedBox(
              width: 27.w,
            ),
          ],
        )
      ],
    );
  }
}
