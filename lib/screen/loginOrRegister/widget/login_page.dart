import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/model/user_info_save_model.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/app_dimens/app_dimens.dart';
import '../../../resources/components/custom_input_field.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';
import '../provider/login_notifier.dart';

final loginProvider = NotifierProvider<LoginNotifier, Map<String, dynamic>>(LoginNotifier.new);
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final codeController = useTextEditingController();
    final isRememberPwdSelected = useState(false);
    final bool themeDark = ref.watch(themeNotifier);
    String locale = ref.watch(languageProvider).languageCode;

    final userInfoFuture = ref.watch(loginProvider);
    if (userInfoFuture.isNotEmpty) {
      UserInfo mUserInfo = UserInfo.fromJson(userInfoFuture);
      usernameController.text = mUserInfo.username;
      passwordController.text = mUserInfo.password;
      isRememberPwdSelected.value = mUserInfo.rememberPassword;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomInputField(
          onChanged: (value) {},
          controller: usernameController,
          hintText: languageService.translate('please_input_user_name', locale: locale),
          icon: AppImageAssets.iconUser,
        ),
        SizedBox(
          height: 14.h,
        ),
        CustomInputField(
          onChanged: (value) {},
          obscureText: true,
          controller: passwordController,
          hintText: languageService.translate('please_input_pwd', locale: locale),
          icon: AppImageAssets.iconPwd,
        ),
         SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            CustomInputField(
              width: 250.w,
              onChanged: (value) {},
              controller: codeController,
              hintText: languageService.translate('please_input_code', locale: locale),
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
                color: themeDark ? AppDarkColors.colorD9FFFFF : Colors.white,
                borderRadius: BorderRadius.circular(8.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
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
          height: 36.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    isRememberPwdSelected.value = !isRememberPwdSelected.value;
                  },
                  child: Image.asset(
                    !isRememberPwdSelected.value
                        ? AppImageAssets.iconNotSelect
                        : AppImageAssets.iconSelectPwd,
                    width: 26.w,
                    height: 26.w,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  languageService.translate('remember_password', locale: locale),
                  style:  TextStyle(
                      fontSize: 20.sp, color: AppColors.color111428),
                ),
              ],
            ),
            Text(
              languageService.translate('forgot_password', locale: locale),
              style: TextStyle(fontSize: 20.sp, color: AppColors.colorA57BF2),
            )
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        InkWell(
          onTap: () {
            ref.read(loginProvider.notifier).login(
                  context,
                  usernameController.text,
                  passwordController.text,
                  isRememberPwdSelected.value,
                  codeController.text,
                );
          },
          child: Container(
            width: 432.w,
            height: 68.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
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
              languageService.translate('login', locale: locale),
              style: TextStyle(fontSize: 30.sp, color: themeDark  ? AppDarkColors.colorD9FFFFF : Colors.white),
            ),
          ),
        ),
        SizedBox(height: 24.h,),
      ],
    );
  }
}
