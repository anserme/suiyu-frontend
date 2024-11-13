import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_consts/app_consts.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:fpbrowser/resources/components/search_input.dart';
import 'package:fpbrowser/screen/home/provider/broeser_window_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/cumstom_text_style.dart';
import '../../../resources/components/custom_contain_select.dart';
import '../../../resources/components/custom_drop_down.dart';
import '../../../resources/components/custom_list_bottom.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/components/popup.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';
import '../provider/employee_management_provider.dart';

///
/// 浏览器窗口
///

final browserWindowSelectListProvider = NotifierProvider<BrowserWindowSelectList, List<BrowserWindowSelect>>(BrowserWindowSelectList.new);
final employeeManagementContentListProvider = NotifierProvider<EmployeeManagementContentList, List<EmployeeManagementContent>>(EmployeeManagementContentList.new);
class BrowserWindowPage extends HookConsumerWidget {
  const BrowserWindowPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final usernameController = useTextEditingController();
    final bool themeDark = ref.watch(themeNotifier);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        15.w,
        20.h,
        23.w,
        9.h,
      ),
      child: Column(
        children: [
          CustomContainStyle(
            padding: EdgeInsets.fromLTRB(
                10.w, 10.h, 13.w, 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                   const CustomTextStyle(text: '已用：1/总数：10'),
                    SizedBox(
                      width: 14.w,
                    ),
                    const CustomTextStyle(text: '今日打开：0/总数：0'),
                    SizedBox(
                      width: 25.w,
                    ),
                    CustomTextStyle(
                      text: "${languageService.translate("select_employee_attendance_search", locale: locale)}：",
                      textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      textSize: 14.sp,
                    ),
                    CustomDropDown(
                      hintText:languageService.translate("all", locale: locale),
                    ),
                    CustomTextStyle(
                      text: languageService.translate("window_name", locale: locale),
                      textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      textSize: 14.sp,
                    ),
                    CustomDropDown(
                      hintText: languageService.translate("all", locale: locale),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    SearchInputWidget(
                      controller: usernameController,
                    ),
                    CustomButtonGradation(text: languageService.translate("search", locale: locale)),
                  ],
                ),
                Row(
                  children: [
                    CustomButtonGradation(
                      text: languageService.translate("search", locale: locale),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: themeDark ? AppDarkColors.colorD9FFFFF : Colors.white,
                            size: 16.h,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          CustomTextStyle(
                            text:languageService.translate("create_window", locale: locale),
                            textColor: themeDark ? AppDarkColors.colorD9FFFFF: Colors.white,
                          ),
                          SizedBox(
                            width: 13.w
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: themeDark ? AppDarkColors.colorD9FFFFF: Colors.white,
                            size: 17.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Expanded(
              child: CustomContainStyle(
            padding: EdgeInsets.fromLTRB(
              10.w,
              12.h,
              19.w,
              18.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 44.h,
                      width: 509.w,
                      child: HookConsumer(
                        builder: (context, ref, child) {
                          final todos =
                              ref.watch(browserWindowSelectListProvider);
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: todos.length, // 列表项的数量
                            itemBuilder: (context, index) {
                              var model = todos[index];
                              return ContainSelectSwitch(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(2.h),
                                  bottomLeft: Radius.circular(2.h),
                                ),
                                text: model.name,
                                colors: model.isSelect
                                    ? [
                                        AppColors.colorBE93EA,
                                        AppColors.colorA57BF2
                                      ]
                                    : [themeDark ? AppDarkColors.colorD9FFFFF: Colors.white, themeDark ? AppDarkColors.colorD9FFFFF: Colors.white],
                                borderColor: model.isSelect
                                    ? Colors.transparent
                                    : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                                textColor: model.isSelect
                                    ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white
                                    : AppColors.color612CD9,
                                onTap: () {
                                  ref
                                      .read(browserWindowSelectListProvider
                                          .notifier)
                                      .selectItem(id: index);
                                },
                                width: 84.w,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        CustomButtonGradation(
                          text: '',
                          left: 7.w,
                          top: 7.w,
                          right: 7.w,
                          bottom: 7.w,
                          child: Image.asset(
                            AppImageAssets.iconBrowserWindowSave,
                            width: 18.w,
                            height: 18.w,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomButtonGradation(
                          text: '',
                          left: 7.w,
                          top: 7.w,
                          right: 7.w,
                          bottom: 7.w,
                          child: Image.asset(
                            AppImageAssets.iconBrowserWindowShare,
                            width: 18.w,
                            height: 18.w,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomButtonGradation(
                          text: '',
                          left: 7.w,
                          top: 7.w,
                          right: 7.w,
                          bottom: 7.w,
                          child: Image.asset(
                            AppImageAssets.iconBrowserWindowSetting,
                            width: 18.w,
                            height: 18.w,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomButtonGradation(
                          text: '',
                          left: 7.w,
                          top: 7.w,
                          right: 7.w,
                          bottom: 7.w,
                          child: Image.asset(
                            AppImageAssets.iconBrowserWindowSave,
                            width: 18.w,
                            height: 18.w,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomPopup(
                          showArrow: true,
                          barrierColor: Colors.transparent,
                          backgroundColor: themeDark ? AppDarkColors.colorD9FFFFF: Colors.white,
                          isFixedDisplayRight: true,
                          content: Container(
                            width: 250.w,
                              height: 567.h,
                              decoration: BoxDecoration(
                                color: themeDark ? AppDarkColors.colorD9FFFFF: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // 改变阴影的位置，x、y轴偏移量
                                  ),
                                ],
                              ),
                            padding:
                                EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                            child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  leftIconRightText(AppConsts.icons[index], AppConsts.modity[index], index, context),
                              separatorBuilder: (context, index) => SizedBox(
                                width: 240.w,
                                child: Divider(
                                  color:
                                      AppColors.color6F1D77.withOpacity(0.12),
                                ),
                              ),
                              itemCount: AppConsts.icons.length,
                            ),
                          ),
                          child: CustomButtonGradation(
                            text: languageService.translate("more_controls", locale: locale),
                            isShowIcon: true,
                            left: 7.w,
                            top: 6.h,
                            right: 7.w,
                            bottom: 6.h,
                            iconPath: AppImageAssets.iconBrowserWindowMore,
                            iconWidth: 18.w,
                            iconHeight: 18.w,
                            textColor: themeDark ? AppDarkColors.colorD9FFFFF: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomButtonGradation(
                          text: '',
                          left: 7.w,
                          top: 7.w,
                          right: 7.w,
                          bottom: 7.w,
                          child: Image.asset(
                            AppImageAssets.iconBrowserWindowRefresh,
                            width: 18.w,
                            height: 18.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                _groupManagementTitle(locale, themeDark),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: HookConsumer(builder: (context, ref, child) {
                    var todos =
                        ref.watch(employeeManagementContentListProvider);

                    return ListView.builder(
                      itemCount: todos.length, // 列表项的数量
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          onEnter: (PointerEvent details) {
                            print("onEnter");
                            ref
                                .read(employeeManagementContentListProvider
                                    .notifier)
                                .editEnter(id: index);
                          },
                          onExit: (PointerEvent details) {
                            print("onExit");

                            ref
                                .read(employeeManagementContentListProvider
                                    .notifier)
                                .editOut(id: index);
                          },
                          onHover: (PointerEvent details) {
                            print("onHover");

                            // ref.read(employeeManagementContentListProvider.notifier).editHover(id: index);
                          },
                          child: InkWell(
                            onTap: () {
                              print("点击item");
                              ref
                                  .read(employeeManagementContentListProvider
                                      .notifier)
                                  .editSelect(id: index);
                            },
                            child:
                                _employeeManagementContent(todos[index], index, themeDark),
                          ),
                        );
                      },
                    );
                  }),
                ),
                CustomListBottom()
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _groupManagementTitle(String locale, bool themeDark) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: themeDark ? AppDarkColors.colorD9FFFFF: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.color14000000,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 143.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              languageService.translate("order", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 178.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              languageService.translate("group", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 137.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              languageService.translate("window_name", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 137.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              languageService.translate("account_platform", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 169.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              languageService.translate("proxy_ip", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 169.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              languageService.translate("remark", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 165.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              languageService.translate("create_time", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 218.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              languageService.translate("disposition", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 200.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              languageService.translate("open", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 76.w,
            padding: EdgeInsets.only(left: 18.w),
            child: Text(
              languageService.translate("in_common_use", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _employeeManagementContent(
      EmployeeManagementContent content, int index, bool themeDark) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: content.isHover || content.isEnter
            ? AppColors.colorE7DAF8
            : content.isSelect
            ? AppColors.colorA57BF2
            : index % 2 == 0
            ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white
            : AppColors.colorFAFAFA,
        border:  Border(
          top: BorderSide.none,      // 不显示上边框
          right: BorderSide.none,    // 不显示右边框
          left: BorderSide.none,     // 不显示左边框
          bottom: BorderSide(
            color: content.isHover || content.isEnter ?  AppColors.color612CD9 : Colors.transparent,      // 下边框颜色
            width: 2.w,                // 下边框宽度
          ),
        ),
      ),

      child: Row(
        children: [
          Container(
            width: 143.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              content.userName,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 178.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "未分组",
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 137.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              '公共商户',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 137.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              '15671718898',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 169.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              '2023-08-10',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 169.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              '上海源之欣',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 165.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              '2023-08-10',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 218.w,
            padding: EdgeInsets.only(left: 8.w),
            child: SizedBox(),
          ),
          Container(
            width: 200.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              '2023-08-10',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? themeDark ? AppDarkColors.colorD9FFFFF: Colors.white : AppColors.color101216,
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.only(left: 18.w),
              child: Image.asset(
                AppImageAssets.iconBrowserWindowCollect,
                width: 18.w,
                height: 18.w,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget leftIconRightText(String path, String text, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 17.w,
            top: 2.h,
            bottom: 2.h,
            right: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  path,
                  width: 16.h,
                  height: 14.h,
                ),
                SizedBox(
                  width: 9.w,
                ),
                CustomTextStyle(
                  text: text,
                  textSize: 14.sp,
                  textColor: index == 13
                      ? AppColors.colorE83C3C
                      : AppColors.color181818,
                )
              ],
            ),
            (index == 4 ||
                    index == 6 ||
                    index == 7 ||
                    index == 8 ||
                    index == 9 ||
                    index == 12 ||
                    index == 13)
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 14.w,
                    color: Colors.black,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
