import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/components/custom_input_field_boder.dart';
import 'package:fpbrowser/screen/home/provider/employee_management_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custom_button_gradation.dart';
import '../../../resources/components/custom_drop_down.dart';
import '../../../resources/components/custom_list_bottom.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';
import '../provider/expense_manage_notifier.dart';
///
/// 员工管理
///
final employeeManagementPeopleListProvider = NotifierProvider<
    EmployeeManagementAddPeopleList,
    List<EmployeeManagementAddPeople>>(EmployeeManagementAddPeopleList.new);
final employeeManagementContentListProvider = NotifierProvider<
    EmployeeManagementContentList,
    List<EmployeeManagementContent>>(EmployeeManagementContentList.new);


class EmployeeManagementPage extends HookConsumerWidget {
   EmployeeManagementPage({super.key});
  // final usernameController = useTextEditingController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Padding(
      padding: EdgeInsets.fromLTRB(
          17.w, 22.h, 25.w, 26.h),
      child: Row(
        children: [
          SizedBox(
            width: 380.w,
            child: CustomContainStyle(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20.h,), child: Row(
                        children: [
                          SizedBox(
                            width: 19.w,
                          ),
                          SizedBox(
                            height: 20.h,
                            child: VerticalDivider(
                              color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                              thickness: 4,
                            ),
                          ),
                          Text(
                            languageService.translate('role_management', locale: locale),
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1),
                          ),
                        ],
                      ),),
                      HookConsumer(
                        builder: (context, ref, child) {
                          return  InkWell(
                            onTap: () {
                              ref.read(expenseManageProvider.notifier).setExpenseManage(true);
                            },
                            child: CustomButtonGradation(
                              margin: EdgeInsets.only(
                                  right: 23.w, top: 20.h),
                              text: languageService.translate('add', locale: locale),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                    child: HookConsumer(
                      builder: (context, ref, child) {
                        final todos =
                            ref.watch(employeeManagementPeopleListProvider);
                        return ListView.builder(
                          itemCount: todos.length, // 列表项的数量
                          itemBuilder: (context, index) {
                            return _employeeManagementPeopleWidget(
                                todos[index], locale);
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
            child: CustomContainStyle(
              padding: EdgeInsets.fromLTRB(
                  25.w, 20.h, 11.w, 22.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${languageService.translate('employee', locale: locale)}（1/1）",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.color161E36),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            "${languageService.translate('role', locale: locale)}：",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: themeDark ? AppDarkColors.color333333: AppColors.color333333),
                          ),
                          CustomDropDown(
                            hintText: languageService.translate('all', locale: locale),
                          ),
                          Text(
                            "${languageService.translate('user_name', locale: locale)}：",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: themeDark ? AppDarkColors.color333333: AppColors.color333333),
                          ),
                           CustomInputFieldBorder(
                              // controller: usernameController,
                              ),
                          SizedBox(
                            width: 7.w,
                          ),
                          CustomButtonGradation(
                            text: languageService.translate('query', locale: locale),
                          ),
                        ],
                      ),
                      CustomButtonGradation(
                        text: languageService.translate('add_employee', locale: locale),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _employeeManagementTitle(locale),
                  Expanded(
                    child: HookConsumer(
                      builder: (context, ref, child) {
                        final todos = ref.watch(employeeManagementContentListProvider);
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
                                child: _employeeManagementContent(todos[index], index, themeDark),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  CustomListBottom()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _employeeManagementPeopleWidget(EmployeeManagementAddPeople todo, String locale) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              21.w, 13.h, 65.w, 13.h),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.color14000000,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                languageService.translate('user_name_2', locale: locale),
                style: TextStyle(
                    color: AppColors.color101216, fontSize: 14.sp),
              ),
              Text(
                languageService.translate('controls', locale: locale),
                style: TextStyle(
                    color: AppColors.color101216, fontSize: 14.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              21.w, 13.h, 65.w, 13.h),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.color14000000,
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                todo.userName,
                style: TextStyle(
                    color: AppColors.color101216, fontSize: 14.sp),
              ),
              Row(
                children: [
                  Image.asset(
                    AppImageAssets.employeeEdit,
                    width: 17.w,
                    height: 18.h,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Image.asset(
                    AppImageAssets.employeeDel,
                    width: 16.h,
                    height: 18.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _employeeManagementTitle(String locale) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 13.h, 0, 13.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.color14000000,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        height: 48.h,
        child: Row(
          children: [
            Container(
              width: 188.w,
              padding: EdgeInsets.only(left: 25.w),
              child: Text(
                languageService.translate("user_name_2", locale: locale),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                ),
              ),
            ),
            Container(
              width: 189.w,
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                languageService.translate("window_number", locale: locale),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                ),
              ),
            ),
            Container(
              width: 139.w,
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                languageService.translate("cell_phone_environment_number", locale: locale),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                ),
              ),
            ),
            SizedBox(
              width: 151.w,
              child: Text(
                languageService.translate("role_identity", locale: locale),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                ),
              ),
            ),
            Container(
              width: 153.w,
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                languageService.translate("statue", locale: locale),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                ),
              ),
            ),
          ],
        ),
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
            width: 188.w,
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
            width: 184.w,
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
            width: 139.w,
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
            width: 153.w,
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
            width: 156.w,
            padding:
                EdgeInsets.only(left: 16.h, right: 112.w),
            child: Image.asset(
              content.statue
                  ? AppImageAssets.iconHomeSwitch
                  : AppImageAssets.iconHomeSwitch,
              width: 28.w,
              height: 14.h,
            ), // 没有关闭状态的图
          ),
          Container(
            width: 222.w,
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
                    padding: EdgeInsets.symmetric(horizontal: 5.w,),
                    child: Image.asset(
                      AppImageAssets.employeeControl,
                      width: 16.h,
                      height: 16.h,
                      color: content.isSelect ? Colors.white : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,

                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w,),
                    child: Image.asset(
                      AppImageAssets.employeeEdit,
                      width: 17.w,
                      height: 18.h,
                      color: content.isSelect ? Colors.white : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
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
                      color: content.isSelect ? Colors.white : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,

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
                      color: content.isSelect ? Colors.white : themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,

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
