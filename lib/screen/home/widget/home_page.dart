import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/components/custom_button.dart';
import 'package:fpbrowser/resources/components/custome_contain_style.dart';
import 'package:fpbrowser/screen/home/provider/home_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_assets/app_image_assets.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';

final todoListProvider = NotifierProvider<SetMealList, List<SetMealBean>>(SetMealList.new);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Padding(
      padding: EdgeInsets.only(
          left: 13.w, right: 25.w, top: 14.h),
      child: Column(
        children: [
          SizedBox(
            height: 106.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: homeFourPic(
                  AppImageAssets.homeGroupControlSystem,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            languageService.translate("group_control_system", locale: locale ),
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.color161E36),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Container(
                            width: 50.w,
                            height: 18.h,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImageAssets.homeNew),
                                fit: BoxFit.cover, // 填充整个屏幕
                              ),
                            ),
                            child: Text(
                              "NEW",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h
                      ),
                      Text(
                        languageService.translate("group_control_system_content", locale: locale),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.color161E36),
                      )
                    ],
                  ),
                )),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: homeFourPic(
                    AppImageAssets.homeProxyIpRecommendation,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          languageService.translate("proxy_ip_recommendation", locale: locale),
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.color161E36),
                        ),
                        SizedBox(
                          height: 8.h
                        ),
                        Text(
                          languageService.translate("group_control_system_content", locale: locale),
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.color161E36),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: homeFourPic(AppImageAssets.homeMarineResourcePooling, Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        languageService.translate("marine_resource_pooling", locale: locale),
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.color161E36),
                      ),
                      SizedBox(
                        height: 8.h
                      ),
                      Text(
                        languageService.translate("group_control_system_content", locale: locale),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.color161E36),
                      )
                    ],
                  ),)
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: homeFourPic(AppImageAssets.homeScriptMarket, Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        languageService.translate("script_market", locale: locale),
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.color161E36),
                      ),
                      SizedBox(
                        height: 8.h
                      ),
                      Text(
                        languageService.translate("group_control_system_content", locale: locale),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.color161E36),
                      )
                    ],
                  ),),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 106.h,
                  margin: EdgeInsets.only(right: 10.w, top: 10.h),
                  padding: EdgeInsets.fromLTRB(
                      34.w, 24.h, 27.w, 0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.colorE6DCFF, // 渐变的上方颜色
                        AppColors.colorC2FFFFFF, // 渐变的下方颜色
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(5.w),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.color0F820D93, // 阴影颜色
                        blurRadius: 4, // 模糊半径
                        spreadRadius: 4, // 扩展半径
                        offset: Offset(0, 2), // 阴影偏移
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            languageService.translate("use_info", locale: locale),
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.color161E36),
                          ),
                          SizedBox(
                            height: 8.h
                          ),
                          Row(
                            children: [
                              Text(
                                "${languageService.translate("user", locale: locale)}chytest",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.color161E36),
                              ),
                              SizedBox(width: 38.w,),
                              Text(
                                "${languageService.translate("identity", locale: locale)}主账号",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.color161E36),
                              ),
                              SizedBox(width: 38.w,),
                              Text(
                                "${languageService.translate("account_balance", locale: locale)}0",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.color161E36),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomButton(text: languageService.translate("top_up", locale: locale)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 106.h,
                  margin: EdgeInsets.only(left: 10.w, top: 10.h),
                  padding: EdgeInsets.fromLTRB(
                      19.w, 18.h, 19.w, 0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.colorE6DCFF, // 渐变的上方颜色
                        AppColors.colorC2FFFFFF, // 渐变的下方颜色
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(5.w),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.color0F820D93, // 阴影颜色
                        blurRadius: 4, // 模糊半径
                        spreadRadius: 4, // 扩展半径
                        offset: Offset(0, 2), // 阴影偏移
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageService.translate("document", locale: locale),
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.color161E36),
                      ),
                      SizedBox(
                        height: 8.h
                      ),
                      Row(
                        children: [
                          CustomButton(text: languageService.translate('user_help', locale: locale), horizontal: 23.w),
                          SizedBox(
                            width: 22.w,
                          ),
                          CustomButton(
                            text: languageService.translate("faq", locale: locale),
                            horizontal: 23.w,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomButton(
                            text: languageService.translate("faq_content", locale: locale),
                            horizontal: 23.w,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 405.h,
                  decoration: BoxDecoration(
                    color: themeDark ? AppDarkColors.colorD9FFFFF :  AppColors.colorD9FFFFF,
                    borderRadius: BorderRadius.circular(5.w),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.color10FFFFF, // 阴影颜色
                        blurRadius: 4, // 模糊半径
                        spreadRadius: 4, // 扩展半径
                        offset: Offset(0, 2), // 阴影偏移
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 35.w,
                            top: 16.h,
                            bottom: 19.h,),
                        height: 60.h,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.colorBE93EA, // 渐变的上方颜色
                              AppColors.colorA57BF2, // 渐变的下方颜色
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          // 可选：设置圆角
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.color10FFFFF, // 阴影颜色
                              blurRadius: 4, // 模糊半径
                              spreadRadius: 4, // 扩展半径
                              offset: Offset(0, 2), // 阴影偏移
                            ),
                          ],
                        ),
                        child: Text(
                          "经典套餐：窗口环境10个+员工1个  额外增加员工0个     有效期：永久可用",
                          style: TextStyle(
                              fontSize: 18.sp, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: HookConsumer(
                          builder: (context, ref, child) {
                            final todos = ref.watch(todoListProvider);
                            return ListView.builder(
                              itemCount: todos.length, // 列表项的数量
                              itemBuilder: (context, index) {
                                return _setMealInfoItem(todos[index], locale);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 405.h,
                  child: CustomContainStyle(
                    padding: EdgeInsets.only(
                        top: 12.h,
                        left: 11.w,
                        right: 21.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 16.w,
                            ),
                            Image.asset(
                              AppImageAssets.homeNotifyItem,
                              width: 30.w,
                              height: 30.w,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              languageService.translate("notification", locale: locale),
                              style: TextStyle(
                                color: AppColors.color161E36,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              notifyWidget(locale),
                              notifyWidget(locale),
                              notifyWidget(locale),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CustomContainStyle(
                      padding: EdgeInsets.only(
                        left: 33.w,
                        top: 23.h,
                        bottom: 25.h,
                      ),
                      child: Text(
                        "跨境王营销软件，Facebook/WhatsApp群控营销软件、Ws客服系统、Ws筛号软件、Ws采集软件",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: themeDark ? AppDarkColors.color333333: AppColors.color333333),
                      ),
                    ),
                    Positioned(
                      bottom: 25.h,
                      right: 37.h,
                      child: Image.asset(
                        AppImageAssets.homeMoreRight,
                        width: 14.w,
                        height: 14.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Stack(
                  children: [
                    CustomContainStyle(
                      padding: EdgeInsets.only(
                          left: 33.w,
                          top: 23.h,
                          bottom: 25.h),
                      child: Text(
                        "跨境王营销软件，Facebook/WhatsApp群控营销软件、Ws客服系统、Ws筛号软件、Ws采集软件",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: themeDark ? AppDarkColors.color333333: AppColors.color333333),
                      ),
                    ),
                    Positioned(
                      bottom: 25.h,
                      right: 37.w,
                      child: Image.asset(
                        AppImageAssets.homeMoreRight,
                        width: 14.w,
                        height: 14.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _setMealInfoItem(SetMealBean bean, String locale) {
    return Column(
      children: [
        Container(
          height: 91.h,
          padding: EdgeInsets.fromLTRB(31.w, 30.h, 13.w, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    bean.icon,
                    width: 36.h,
                    height: 36.h,
                  ),
                  SizedBox(width: 18.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bean.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.color161E36,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${languageService.translate("total_amount", locale: locale)}${bean.setMealBeanItem.totalAmount}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.color161E36,
                            ),
                          ),
                          bean.setMealBeanItem.use != 0
                              ? Text(
                            "${languageService.translate("use", locale: locale)}${bean.setMealBeanItem.use}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.color161E36,
                            ),
                          )
                              : const SizedBox(),
                          bean.setMealBeanItem.authorized != 0
                              ? Text(
                            "${languageService.translate("authorized",  locale: locale)}${bean.setMealBeanItem.authorized}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.color161E36,
                            ),
                          )
                              : const SizedBox(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: itemSetMealInfoService(bean.serviceItem),
              )
            ],
          ),
        ),
        Divider(thickness: 1.w, color: AppColors.color179509F5, endIndent: 17.w, indent: 13.w)
      ],
    );
  }

  List<Widget> itemSetMealInfoService(List<String> item) {
    List<Widget> widgetItem = [];
    for (String serviceItem in item) {
      widgetItem.add(
        CustomButton(
          text: serviceItem,
          margin: EdgeInsets.only(left: 12.w),
        ),
      );
    }
    return widgetItem;
  }

  Widget notifyWidget(String locale) {
    return Column(
      children: [
        SizedBox(
          height: 58.h,
          child: Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              Image.asset(
                AppImageAssets.homeNotifity,
                width: 12.w,
                height: 14.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Text(
                  languageService.translate("notify_info",  locale: locale),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.color161E36,
                  ),
                ),
              ),
              Text(
                "2024-09-04",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.color161E36,
                ),
              ),
              SizedBox(
                width: 21.h,
              ),
            ],
          ),
        ),
        Divider(
          height: 1.h,
          color: AppColors.color179509F5,
        ),
      ],
    );
  }

  /// 四张图片
  Widget homeFourPic(String picPath, Widget child) {
    return Expanded(
      child: Container(
        height: 106.h,
        padding: EdgeInsets.only(left: 106.w, top: 15.h),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(picPath),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
