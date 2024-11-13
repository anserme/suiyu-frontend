import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/lations/provider/language_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_assets/app_image_assets.dart';
import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/app_dimens/app_dimens.dart';
import '../../../resources/components/custom_input_field.dart';
import '../provider/register_notifier.dart';

class RegisterWidget extends HookConsumerWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registrationNotifier = ref.read(registrationProvider.notifier);
    final usernameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final codeController = useTextEditingController();
    String locale = ref.watch(languageProvider).languageCode;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomInputField(
          controller: usernameController,
          hintText: languageService.translate("user_name", locale: locale),
          icon: AppImageAssets.iconUser,
        ),
         SizedBox(
          height: 14.h,
        ),
        CustomInputField(
          controller: phoneController,
          hintText: languageService.translate('phone_number', locale: locale),
          icon: AppImageAssets.iconPhone,
        ),
         SizedBox(
          height: 14.h,
        ),
        CustomInputField(
          obscureText: true,
          controller: passwordController,
          hintText: languageService.translate('password', locale: locale),
          icon: AppImageAssets.iconPwd,
        ),
         SizedBox(
          height: 14.h,
        ),
        Row(
          children: [
            CustomInputField(
              controller: codeController,
              width: 250.w,
              hintText: languageService.translate('phone_code', locale: locale),
              icon: AppImageAssets.iconCode,
            ),
            SizedBox(
              width: 20.w,
            ),
            Container(
              width: 156.w,
              height: 68.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                "3478",
                style: TextStyle(color: AppColors.color666666, fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
         SizedBox(
          height: 25.h,
        ),
        InkWell(
          onTap: () {
            registrationNotifier.submit(usernameController.text, passwordController.text, codeController.text, passwordController.text);
          },
          child: Container(
            width: 431.w,
            height: 68.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: const LinearGradient(
                colors: [
                  AppColors.colorBE93EA,
                  AppColors.colorA57BF2,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
    languageService.translate('register', locale: locale,),
              style: TextStyle(fontSize: 30.sp, color: Colors.white),
            ),
          ),
        ),
         SizedBox(
          height: 19.h,
        ),
        Text(languageService.translate('have_account_login',locale: locale), style: TextStyle(fontSize: 20.sp, color: AppColors.colorA57BF2), textAlign: TextAlign.center,),
        SizedBox(height: 22.h,)
      ],
    );
  }
}