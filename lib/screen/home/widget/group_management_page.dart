import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:fpbrowser/resources/components/custome_contain_style.dart';
import 'package:fpbrowser/screen/home/dialog/window_adjustment_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_assets/app_image_assets.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custom_contain_select.dart';
import '../../../resources/components/custom_drop_down.dart';
import '../../../resources/components/custom_list_bottom.dart';
import '../../../resources/components/custom_text_and_icon_right.dart';
import '../../../resources/components/search_input.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';
import '../provider/employee_management_provider.dart';

///
/// 分组管理
///

final selectWindowGroup = useState(true);
final employeeManagementContentListProvider = NotifierProvider<
    EmployeeManagementContentList,
    List<EmployeeManagementContent>>(EmployeeManagementContentList.new);

class GroupManagementPage extends HookConsumerWidget {
  const GroupManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String locale = ref.watch(languageProvider).languageCode;
    final usernameController = useTextEditingController();
    final bool themeDark = ref.watch(themeNotifier);

    return Padding(
      padding: EdgeInsets.fromLTRB(
          15.w, 20.h, 25.w, 9.h),
      child: Column(
        children: [
          Container(
            height: 62.h,
            padding: EdgeInsets.only(left: 26.w, right: 12.w),
            decoration: const BoxDecoration(
              color: AppColors.colorD9FFFFF,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${languageService.translate("select_employee_attendance_search", locale: locale)}：",
                      style: TextStyle(
                        color: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        fontSize: 14.sp,
                      ),
                    ),
                    CustomDropDown(
                      hintText: languageService.translate("all", locale: locale),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                     languageService.translate("group_name", locale: locale),
                      style: TextStyle(
                        color: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                        fontSize: 14.sp,
                      ),
                    ),
                    SearchInputWidget(
                      controller: usernameController,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomButtonGradation(text: languageService.translate("query", locale: locale)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return WindowAdjustmentDialog();
                        },);
                  },
                  child: CustomButtonGradation(
                    isShowIcon: true,
                    text: languageService.translate("add", locale: locale),
                    isIcon: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 16.h,
                    ),
                  ),
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
                    children: [
                      ContainSelectSwitch(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2.h),
                          bottomLeft: Radius.circular(2.h),
                        ),
                        text: languageService.translate("group_name2", locale: locale),
                        colors: selectWindowGroup.value
                            ? [AppColors.colorBE93EA, AppColors.colorA57BF2]
                            : [Colors.white, Colors.white],
                        borderColor: selectWindowGroup.value
                            ? Colors.transparent
                            : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                        textColor: selectWindowGroup.value
                            ? Colors.white
                            : AppColors.color612CD9,
                        onTap: () {
                          print("点击");
                          selectWindowGroup.value = !selectWindowGroup.value;
                        },
                        width: 84.w,
                      ),
                      ContainSelectSwitch(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(2.h),
                          bottomRight: Radius.circular(2.h),
                        ),
                        text: languageService.translate("cell_phone_environment_grouping", locale: locale),
                        colors: !selectWindowGroup.value
                            ? [AppColors.colorBE93EA, AppColors.colorA57BF2]
                            : [Colors.white, Colors.white],
                        borderColor: !selectWindowGroup.value
                            ? Colors.transparent
                            : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                        textColor: !selectWindowGroup.value
                            ? Colors.white
                            : AppColors.color612CD9,
                        onTap: () {
                          selectWindowGroup.value = !selectWindowGroup.value;
                        },
                        width: 100.w,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  _groupManagementTitle(locale),
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
                              ref.read(employeeManagementContentListProvider.notifier).editEnter(id: index);
                            },
                            onExit: (PointerEvent details) {
                              ref.read(employeeManagementContentListProvider.notifier).editOut(id: index);
                            },
                            onHover: (PointerEvent details) {
                            },
                            child: InkWell(
                              onTap: () {
                                ref.read(employeeManagementContentListProvider.notifier).editSelect(id: index);
                              },
                              child: _employeeManagementContent(todos[index], index, themeDark),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  CustomListBottom()
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _groupManagementTitle(String locale) {
    return Container(
      height: 48.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
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
            width: 251.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              languageService.translate("group_name2", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width:192.w,
            padding: EdgeInsets.only(left: 20.w),
            child: CustomTextAndIconRight(
              text: languageService.translate("order", locale: locale),
            ),
          ),
          Container(
            width: 241.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              languageService.translate("number_grouped_windows", locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 420.w,
            child: CustomTextAndIconRight(
              text: languageService.translate("ownership", locale: locale),
              iconData: Icons.arrow_downward,
            ),
          ),
          Container(
            width: 324.w,
            padding: EdgeInsets.only(left: 8.w),
            child: CustomTextAndIconRight(
              text: languageService.translate("create_time", locale: locale),
              iconData: Icons.arrow_downward,
            ),
          ),
          Container(
            width: 138.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              languageService.translate("controls", locale: locale),
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

  Widget _employeeManagementContent(EmployeeManagementContent content, int index, bool themeDark) {

    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: content.isHover || content.isEnter
            ? AppColors.colorE7DAF8
            : content.isSelect
            ? AppColors.colorA57BF2
            : index % 2 == 0
            ? Colors.white
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
            width: 251.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              content.userName,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width:192.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              content.windowNumber,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 241.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              content.mobilePhoneEnvironmentNumber,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          SizedBox(
            width: 420.w,
            // padding: EdgeInsets.only(left: 0),
            child: Text(
              content.identity,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 324.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              content.time,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 138.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Image.asset(
                      AppImageAssets.employeeControl,
                      width: 16.h,
                      height: 16.h,
                      color: content.isSelect ? Colors.white :  themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Image.asset(
                      AppImageAssets.employeeEdit,
                      width: 17.w,
                      height: 18.h,
                      color: content.isSelect ? Colors.white :  themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,

                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Image.asset(
                      AppImageAssets.employeeCopy,
                      width: 17.w,
                      height: 18.h,
                      color: content.isSelect ? Colors.white :  themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,

                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Image.asset(
                      AppImageAssets.employeeDel,
                      width: 17.w,
                      height: 18.w,
                      color: content.isSelect ? Colors.white :  themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
