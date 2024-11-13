import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/screen/home/dialog/operation_log_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/app_dimens/app_dimens.dart';
import '../../../resources/components/cumstom_text_style.dart';
import '../../../resources/components/custom_button_gradation.dart';
import '../../../resources/components/custom_contain_select.dart';
import '../../../resources/components/custom_drop_down.dart';
import '../../../resources/components/custom_list_bottom.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/components/search_input.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';
import '../provider/employee_management_provider.dart';
import '../provider/operation_log_provider.dart';

///
/// 日志
///
final browserWindowSelectListProvider = NotifierProvider<OperationLogSelectList, List<OperationLogSelect>>(OperationLogSelectList.new);
final employeeManagementContentListProvider = NotifierProvider<
    EmployeeManagementContentList,
    List<EmployeeManagementContent>>(EmployeeManagementContentList.new);

class OperationLogPage extends ConsumerWidget {
  // final usernameController = useTextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return  Padding(
      padding: EdgeInsets.fromLTRB(
        21.w,
        14.h,
        15.w,
        16.h,
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
                    CustomTextStyle(
                      text: languageService.translate('select_employee_account_search', locale: locale),
                      textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      textSize: 14.sp,
                    ),
                    CustomDropDown(
                      hintText: languageService.translate('all'),
                    ),
                    SizedBox(width: 16.h,),
                    CustomTextStyle(
                      text: languageService.translate('selective_category_search', locale: locale),
                      textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      textSize: 14.sp,
                    ),
                    CustomDropDown(
                      hintText: languageService.translate('all', locale: locale),
                    ),
                    SizedBox(width: 16.h,),

                    CustomTextStyle(
                      text: languageService.translate('enter_action_content_search', locale: locale),
                      textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      textSize: 14.sp,
                    ),
                    SearchInputWidget(
                      // controller: usernameController,
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    CustomTextStyle(
                      text: languageService.translate('time_search', locale: locale),
                      textColor: themeDark ? AppDarkColors.color333333: AppColors.color333333,
                      textSize: 14.sp,
                    ),
                    const CustomDropDown(
                      hintText: '2024-10-08',
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomButtonGradation(text: languageService.translate("query", locale: locale)),
                    SizedBox(width: 6.w,),
                    CustomButtonGradation(text: languageService.translate("reset", locale: locale)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: CustomContainStyle(
                padding: EdgeInsets.fromLTRB(
                  10.w,
                  12.h,
                  20.w,
                  33.h,
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
                                        : [Colors.white, Colors.white],
                                    borderColor: model.isSelect
                                        ? Colors.transparent
                                        : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                                    textColor: model.isSelect
                                        ? Colors.white
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
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return OperationLogDialog();
                                });
                          },
                          child: CustomButtonGradation(
                            text: languageService.translate("mask_operation_log", locale: locale),
                            left: 14.w,
                            right: 14.w,
                            top: 9.h,
                            bottom: 9.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    _operationLogTitle(locale),
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

                                // ref.read(employeeManagementContentListProvider.notifier).editHover(id: index);
                              },
                              child: InkWell(
                                onTap: () {
                                  ref.read(employeeManagementContentListProvider.notifier).editSelect(id: index);
                                },
                                child:
                                _employeeManagementContent(todos[index], index),
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
  Widget _operationLogTitle(String locale) {
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
            width: 441.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              languageService.translate('sort', locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 527.w,
            margin: EdgeInsets.only(left: 5.w),
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              languageService.translate('operation_content', locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 373.w, //
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              languageService.translate('operating_user', locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 214.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              languageService.translate('operating_time', locale: locale),
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
      EmployeeManagementContent content, int index) {
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
            width: 441.w,
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
            width: 527.w,
            margin: EdgeInsets.only(left: 5.w),
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              '公共商户',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 373.w, //
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              '15671718898',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 214.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              '2023-08-10 12:12:12',
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
