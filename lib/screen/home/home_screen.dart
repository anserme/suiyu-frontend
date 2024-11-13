import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_colors/app_dark_colors.dart';
import 'package:fpbrowser/resources/theme/provider/theme_provider.dart';
import 'package:fpbrowser/screen/home/provider/expense_manage_notifier.dart';
import 'package:fpbrowser/screen/home/provider/left_menu_provider.dart';
import 'package:fpbrowser/screen/home/widget/browser_window_page.dart';
import 'package:fpbrowser/screen/home/widget/employee_management_page.dart';
import 'package:fpbrowser/screen/home/widget/expense_center_page.dart';
import 'package:fpbrowser/screen/home/widget/expense_management_style.dart';
import 'package:fpbrowser/screen/home/widget/group_management_page.dart';
import 'package:fpbrowser/screen/home/widget/home_page.dart';
import 'package:fpbrowser/screen/home/widget/operation_log_page.dart';
import 'package:fpbrowser/screen/home/widget/promotion_incentive_page.dart';
import 'package:fpbrowser/screen/home/widget/right_notify.dart';
import 'package:fpbrowser/screen/home/widget/setting_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import '../../resources/app_assets/app_image_assets.dart';
import '../../resources/app_colors/app_colors.dart';
import '../../resources/lations/provider/language_notifier.dart';
import 'widget/rigth_top.dart';

final todoListProvider =
    NotifierProvider<LeftMenuList, List<LeftMenu>>(LeftMenuList.new);
final isEmployeeAdd = useState(false);

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return DragToMoveArea(child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeDark ? Colors.black : Colors.white,
              image: const DecorationImage(
                image: AssetImage(AppImageAssets.homeBg),
                fit: BoxFit.cover, // 填充整个屏幕
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 62.h,
                color: Colors.white.withOpacity(0.35),
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          languageService.translate('browser_name', locale: locale),
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: themeDark ? AppDarkColors.color161E36 : AppColors.color161E36,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Container(
                          height: 20.w,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1.withOpacity(0.16),
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "线路1",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: themeDark ? AppDarkColors.color333333: AppColors.color6429D1,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: themeDark ? AppDarkColors.color333333: AppColors.color6429D1,
                                size: 18.w,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const RightTopWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 260.w,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 9.w,
                          right: 11.w,
                        ),
                        width: 260.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 48.w,
                              width: 48.w,
                              margin: EdgeInsets.only(top: 20.h),
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1.withOpacity(0.16),
                                borderRadius: BorderRadius.circular(4.w),
                              ),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              languageService.translate('browser_name',
                                  locale: locale),
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: AppColors.color161E36,
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Expanded(
                              child: HookConsumer(
                                builder: (context, ref, child) {
                                  final todos = ref.watch(todoListProvider);
                                  return ListView.builder(
                                    itemCount: todos.length, // 列表项的数量
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          ref
                                              .read(todoListProvider.notifier)
                                              .edit(id: index);
                                        },
                                        child: _leftItem(todos[index], locale, themeDark),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const RightNotifyWidget(),
                          Expanded(
                            child: HookConsumer(
                              builder: (context, ref, child) {
                                final todos = ref.watch(todoListProvider);
                                LeftMenu todo = todos
                                    .firstWhere((element) => element.isSelect);
                                return getMenuSelect(todo.id);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  /// 根据左侧菜单选项，显示右边数据
  getMenuSelect(int id) {
    switch (id) {
      case 0:
        return const HomePage();
      case 1:
        return const BrowserWindowPage();
      case 2:
        return const SizedBox();
      case 3:
        return const SizedBox();
      case 4:
        return const GroupManagementPage();
      case 5:
        return const SizedBox();
      case 6:
        return const SizedBox();
      case 7:
        return HookConsumer(
          builder: (context, ref, child) {
            bool isAddManage = ref.watch(expenseManageProvider);
            return isAddManage
                ? ExpenseManagementStyle()
                : EmployeeManagementPage();
          },
        );
      case 8:
        return PromotionIncentivePage();
      case 9:
        return const ExpenseCenterPage();
      case 10:
        return SettingPage();
      case 11:
        return OperationLogPage();
      case 12:
        return const SizedBox();
    }
  }

  Widget _leftItem(LeftMenu menu, String locale, bool themeDark) {
    return Container(
      height: 56.h,
      margin: EdgeInsets.only(bottom: 6.h),
      decoration: BoxDecoration(
        gradient: menu.isSelect
            ? const LinearGradient(
                colors: [
                  AppColors.colorBE93EA,
                  AppColors.colorA57BF2,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : LinearGradient(
                colors: [
                  AppColors.color2B8AFF.withOpacity(0.01),
                  AppColors.color2B8AFF.withOpacity(0.01),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        // color: menu.isSelect ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(5.w),
        boxShadow: [
          BoxShadow(
            color: menu.isSelect
                ? AppColors.colorA57BF2.withOpacity(0.2)
                : Colors.transparent,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          menu.isSelect
              ? Container(
                  margin: EdgeInsets.only(left: 1.w),
                  width: 3.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    color: themeDark ? AppDarkColors.colorFF525458: Colors.white, // 背景为白色
                    borderRadius: BorderRadius.circular(1.w),
                  ),
                )
              : SizedBox(
                  width: 4.w,
                ),
          SizedBox(
            width: 45.w,
          ),
          Image.asset(
            menu.isSelect ? menu.iconSelect : menu.icon,
            width: 17.w,
            height: 17.w,
          ),
          SizedBox(
            width: 9.w,
          ),
          Text(
            menu.setItemNameLocale(locale),
            style: TextStyle(
                fontSize: 16.sp,
                color: menu.isSelect ? Colors.white : AppColors.color181818),
          ),
        ],
      ),
    );
  }
}
