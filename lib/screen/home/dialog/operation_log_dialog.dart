import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:fpbrowser/resources/components/custom_drop_down.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/app_dimens/app_dimens.dart';
import '../../../resources/components/cumstom_contain_top_bottom_color.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';

class OperationLogDialog extends HookConsumerWidget {
  final List<double> dotPositions = [10, 50, 100, 150, 200,300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000, 4000, 5000, 6000];
  // 记录哪个圆点被选中
  int? selectedDotIndex = 0;
  final List<double> dotPositions2 = [10, 200, 400, 600, 800,1000];


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints.expand(
            width: 1280.w, height: 800.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 29.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [vip(locale, themeDark), vipPermissions(locale, themeDark)],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 45.w, top: 24.h),
                        child: ContainTopBottomColorStyle(
                          width: 236.w,
                          height: 46.h,
                          topRadius: 8.w,
                          topColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                          bottomWidth: 236.w,
                          bottomHeight: 190.h,
                          bottomRadius: 8.w,
                          bottomColor: Colors.white,
                          bottomBoxShadow: AppColors.color0F820D93,
                          topWidget: CustomTextStyle(
                            text: languageService.translate("key_account_manager", locale: locale),
                            textColor: Colors.white,
                            textSize: 18.sp,
                          ),
                          bottomWidget: Column(
                            children: [
                              SizedBox(
                                height: 12.h,
                              ),
                              Container(
                                width: 110.h,
                                height: 110.h,
                                color: AppColors.colorF4F4F4,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              CustomTextStyle(
                                text: languageService.translate("consulting_product", locale: locale),
                                textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                                textSize: 14.sp,
                              ),
                              SizedBox(
                                height: 8.h
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,),
                                  child: CustomTextStyle(
                                    text: "${languageService.translate('phone', locale: locale)}13888886666${languageService.translate('phone_tip', locale: locale)}",
                                    textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                                    textSize: 12.sp,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 19.h,),
                  Row(
                    children: [
                      CustomTextStyle(
                        text: languageService.translate("environment_number", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                      ),
                      CustomDropDown(
                        hintText: '10',
                        widget: 88.w,
                        height: 36.h,
                        chideIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.colorC9C9C9,
                          size: 16.h,
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      CustomTextStyle(
                        text: languageService.translate("environment_number_tip", locale: locale),
                        textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                        textSize: 14.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        AppImageAssets.iconOperationLogFree,
                        width: 38.w,
                        height: 16.h,
                      ),
                      Positioned(
                        left: 7.w,
                        child: CustomTextStyle(
                          text: "free",
                          textColor: Colors.white,
                          textSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  time(dotPositions),
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    children: [
                      CustomTextStyle(
                        text: languageService.translate("extra_members", locale: locale),
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,
                      ),
                      CustomDropDown(
                        hintText: "10",
                        widget: 88.w,
                        height: 37.h,
                        child: Column(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_up,
                              color: AppColors.colorC9C9C9,
                              size: 16.h,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.colorC9C9C9,
                              size: 16.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      CustomTextStyle(
                        text: languageService.translate("extra_members_tip", locale: locale),
                        textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                        textSize: 14.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  time(dotPositions2),
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    children: [
                      CustomTextStyle(
                        text: "${languageService.translate('time', locale: locale)} ：",
                        textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        textSize: 14.sp,

                      ),
                      timeDay("30天", "打85折", 4.w),
                      SizedBox(
                        width: 4.w,
                      ),
                      timeDay("90天", "打8折", 7.w),
                      SizedBox(
                        width: 4.w,
                      ),
                      timeDay("180天", "打75折", 4.w),
                      SizedBox(
                        width: 4.w,
                      ),
                      timeDay("360天", "打7折", 7.w),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 44.w),
                  ),
                  CustomTextStyle(
                    text: "2024-115-05到期",
                    textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    textSize: 14.sp,

                  ),
                ],
              ),
            ),
            SizedBox(height: 21.h,),
            Expanded(
              child: Stack(
                children: [
                  ContainTopBottomColorStyle(
                    width: double.infinity,
                    height: 56.h,
                    topRadius: 8.w,
                    topColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    backgroundColor1: AppColors.colorE6DCFF,
                    backgroundColor2: Colors.white,
                    bottomWidth: double.infinity,
                    bottomHeight: 134.h,
                    bottomRadius: 8.w,
                    bottomColor: Colors.white,
                    bottomBoxShadow: AppColors.color0F820D93,
                    gradientAlignment: Alignment.topCenter,
                    gradientAlignment2: Alignment.bottomCenter,
                    topWidget: Row(
                      children: [
                        SizedBox(
                          width: 25.w,
                        ),
                        CustomTextStyle(
                          text: languageService.translate("original_package_information", locale: locale),
                          textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                          textSize: 14.sp,
                        ),
                        CustomTextStyle(
                            text: "${languageService.translate('browser_environment_number', locale: locale)}10", textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                        SizedBox(width: 21.w),
                        CustomTextStyle(
                            text: "${languageService.translate('extra_members2', locale: locale)}10", textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                        SizedBox(width: 21.w),
                        CustomTextStyle(
                            text: "${languageService.translate('package_price', locale: locale)}10", textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                        SizedBox(width: 29.w),
                        CustomTextStyle(
                            text: "${languageService.translate('maturity_time', locale: locale)}2024-04-05",
                            textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333, textSize: 14.sp,),
                        SizedBox(width: 21.w),
                        CustomTextStyle(
                          text: languageService.translate("maturity_time_tip", locale: locale),
                          textColor: AppColors.colorA631DC,
                          textSize: 14.sp,
                        ),
                        SizedBox(width: 7.w),
                        CustomTextStyle(
                          text: languageService.translate("maturity_time_tip2", locale: locale),
                          textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                          textSize: 14.sp,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        CustomTextStyle(
                          text: languageService.translate("go_renew", locale: locale),
                          textColor: AppColors.colorA631DC,
                          textSize: 14.sp,
                        )
                      ],
                    ),
                    bottomWidget: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 19.h,
                              ),
                              Row(
                                children: [
                                  CustomTextStyle(
                                    text: languageService.translate("payment_method2", locale: locale),
                                    textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                                    textSize: 14.sp,

                                  ),
                                  pay(
                                      AppImageAssets.iconOperationLogZfb,
                                    languageService.translate("pay_zfb", locale: locale),
                                      "ALIPAY",
                                      8.w,
                                      19.w,
                                      5.h,
                                      4.h, themeDark),
                                  SizedBox(
                                    width: 16.h,
                                  ),
                                  pay(
                                      AppImageAssets.iconOperationLogWx,
                                    languageService.translate("pay_wx", locale: locale),
                                      "WeChat Pay",
                                      8.w,
                                      15.w,
                                      5.h,
                                      4.h, themeDark),
                                  SizedBox(
                                    width: 16.h,
                                  ),
                                  pay2(locale, themeDark)
                                ],
                              ),
                              SizedBox(
                                height: 22.h,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    AppImageAssets.checkBoxSelect,
                                    width: 12.w,
                                    height: 12.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  CustomTextStyle(
                                    text: languageService.translate("pay_method", locale: locale),
                                    textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                                    textSize: 14.sp,

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 23.h,
                          right: 30.w,
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: languageService.translate('amount_payable', locale: locale),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: themeDark ? AppDarkColors.color333333: AppColors.color333333),
                                    ),
                                    TextSpan(
                                      text: '     ￥100.00',
                                      style: TextStyle(
                                          fontSize: 26.sp,
                                          color: AppColors.colorF43838,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '     /30天',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 29.w,),
                              CustomButtonGradation(
                                text: languageService.translate("commit_pay", locale: locale),
                                left: 32.w,
                                right: 32.w,
                                top: 10.h,
                                bottom: 10.h,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 26.h,
                    right:41.h,
                    child: Image.asset(
                      AppImageAssets.iconOperationLogService,
                      width: 48.w,
                      height: 48.w,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget vip(String locale, bool themeDark) {
    return Stack(
      children: [
        Image.asset(
          AppImageAssets.operationLogDialogVip,
          width: 740.w,
          height: 118.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 154.w,
              height: 40.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 15.w,
                    top: 14.h,
                    child: Image.asset(
                      AppImageAssets.operationLogVip,
                      width: 154.w,
                      height: 40.h,
                    ),
                  ),
                  Positioned(
                    left: 28.w,
                    top: 8.h,
                    child: CustomTextStyle(
                      text: "V",
                      textColor: Colors.white,
                      textSize: 28.sp,
                    ),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 18.h,
                    child: CustomTextStyle(
                      text: "Yun Login",
                      textSize: 14.sp,
                      textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: CustomTextStyle(
                text: languageService.translate("member_rights_interests", locale: locale),
                textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                textSize: 24.sp,
              ),
            ),
          ],
        ),
        Positioned(
          right: 72.w,
          top: 11.h,
          child: CustomTextStyle(
            text: "VIP",
            textSize: 66.sp,
            textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
          ),
        ),
      ],
    );
  }

  Widget vipPermissions(String locale, bool themeDark) {
    return Container(
      width: 740.w,
      height: 122.h,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(19.w, 16.h, 30.w, 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.color0F820D93,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          vipPermissionsItem(locale, themeDark),
          SizedBox(width: 36.w,),
          vipPermissionsItem(locale, themeDark),
          SizedBox(width: 36.w,),
          vipPermissionsItem(locale, themeDark),
        ],
      ),
    );
  }

  Widget vipPermissionsItem(String locale, bool themeDark) {
    return Row(
      children: [
        Image.asset(
          AppImageAssets.checkBoxSelect,
          width: 16.h,
          height: 16.h,
        ),
        SizedBox(
          width: 24.w,
        ),
        CustomTextStyle(
          text: languageService.translate("member_rights_interests1", locale: locale),
          textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
          textSize: 14.sp,

        ),
      ],
    );
  }

  Widget timeDay(String day, String discount, double? left) {
    return SizedBox(
      width: 90.w,
      height: 56.h,
      child: Stack(
        children: [
          Positioned(
            right: 2.w,
            top: 15.h,
            child: CustomButtonGradation(
              text: day,
              left: 29.w,
              right: 29.w,
              top: 4.h,
              bottom: 4.h,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Stack(
              children: [
                Image.asset(
                  AppImageAssets.iconOperationLogDiscount,
                  width: 45.w,
                  height: 20.h,
                ),
                Positioned(
                  top: 0,
                  left: left ?? 4.w,
                  child:  CustomTextStyle(
                    text: discount,
                    textColor: Colors.white,
                    textSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pay(String path, String content1, String content2, double left,
      double right, double top, double bottom, bool themeDark) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      decoration: BoxDecoration(
        color: AppColors.color126429D1,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        children: [
          Image.asset(
            AppImageAssets.checkBoxSelect,
            width: 12.h,
            height: 12.h,
          ),
          SizedBox(
            width: 15.w,
          ),
          Image.asset(
            path,
            width: 28.h,
            height: 28.h,
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextStyle(
                text: content1,
                textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                textSize: 14.sp,
              ),
              CustomTextStyle(
                text: content2,
                textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                textSize: 12.sp,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget pay2(String locale, bool themeDark) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.color126429D1,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        children: [
          Image.asset(
            AppImageAssets.checkBoxSelect,
            width: 12.h,
            height: 12.h,
          ),
          SizedBox(
            width: 4.w,
          ),
          CustomTextStyle(
            text: languageService.translate("cloud_coin_payment", locale: locale),
            textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
            textSize: 14.sp,
          ),
          Image.asset(
            AppImageAssets.iconBrowserWindowRefresh,
            color: Colors.black,
            width: 12.w,
            height: 12.w,
          ),
          SizedBox(
            width: 27.w,
          ),
          CustomButtonGradation(
            text: languageService.translate("top_up", locale: locale),
            left: 16.h,
            right: 16.h,
            top: 6.h,
            bottom: 6.h,
          ),
        ],
      ),
    );
  }

  // 实现时间轴
  Widget time(List<double> mList) {
    return Stack(
      clipBehavior: Clip.none, // 允许 Stack 超出边界
      children: [
        // 线条（长500, 宽5, 圆角2）
        Container(
          width: 942.w,
          height: 9.h,
          decoration: BoxDecoration(
            color: AppColors.colorE3D6E8, // 黑色线条
            borderRadius: BorderRadius.circular(5.w),
          ),
        ),
        // 小圆点和数字
        ...mList.map((position) {
          int index = mList.indexOf(position);
          return Positioned(
            left: (942.0 / mList.length) * index - (selectedDotIndex == index ?  5.w : 3.w),  // 小圆点的水平位置
            top: ((selectedDotIndex == index ?  - 5.w : 2.w)),  // 小圆点在竖直方向的位置
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => {},  // 点击小圆点
                  child: Container(
                    width: selectedDotIndex == index ?  18.w : 6.w,
                    height: selectedDotIndex == index ?  18.w : 6.w,
                    decoration: BoxDecoration(
                      color: selectedDotIndex == index
                          ? Colors.white
                          : Colors.white, // 选中时背景为白色
                      border: Border.all(
                        color: selectedDotIndex == index
                            ? AppColors.color612CD9
                            : Colors.transparent, // 选中时边框为蓝色
                        width: 2.w,
                      ),
                      shape: BoxShape.circle,  // 圆形
                    ),
                  ),
                ),
                SizedBox(height: selectedDotIndex == index ? 0 : 5.w),  // 小圆点和数字之间的间距
                CustomTextStyle(
                 text: position.toString(),
                  textSize: 14.sp,
                  textColor: AppColors.color999999,
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
