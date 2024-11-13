import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_consts/app_consts.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';
import 'package:fpbrowser/resources/components/custom_button.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:fpbrowser/resources/components/custom_drop_down.dart';
import 'package:fpbrowser/resources/components/custom_input_field_boder.dart';
import 'package:fpbrowser/screen/home/widget/expense_management_style3.dart';
import 'package:fpbrowser/screen/home/widget/expense_management_style5.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/components/custom_input_border_limit.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../provider/expense_manage_notifier.dart';
import 'expense_management_style2.dart';
import 'expense_management_style4.dart';
import 'expense_management_style_1.dart';

///
/// 设计图倒数第4个
///

class ExpenseManagementStyle extends HookConsumerWidget {
  final scrollController = useScrollController();
  final selectMenu = useState(0);

  // 定义滚动位置列表
  final scrollPositions = [0.0, 706.h, 890.h,  997.h,];
  final buildConfiguration = useState(false);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          17.w, 22.h, 27.w, 26.h),
      child: Row(
        children: [
          SizedBox(
            width: 184.w,
            child: CustomContainStyle(
              padding: EdgeInsets.fromLTRB(
                  14.w, 20.h, 26.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 7.h,
                      ),
                      Image.asset(
                        selectMenu.value == 0 ?  AppImageAssets.iconExpenseManagementCircle1 : AppImageAssets.iconExpenseManagementCircle2,
                        width: 18.h,
                        height: 18.h,
                      ),
                      SizedBox(
                        height: 59.h,
                        child: VerticalDivider(
                          thickness: 2.w,
                          color: selectMenu.value == 0 ? AppColors.colorFFAC88EF : AppColors.colorBABABA,
                        ),
                      ),
                      Image.asset(
                        selectMenu.value == 1 ?  AppImageAssets.iconExpenseManagementCircle1 : AppImageAssets.iconExpenseManagementCircle2,
                        width: 18.h,
                        height: 18.h,
                      ),
                      SizedBox(
                        height: 59.h,
                        child: VerticalDivider(
                          thickness: 2.w,
                          color: selectMenu.value == 1 ? AppColors.colorFFAC88EF : AppColors.colorBABABA,
                        ),
                      ),
                      Image.asset(
                        selectMenu.value == 2 ?  AppImageAssets.iconExpenseManagementCircle1 : AppImageAssets.iconExpenseManagementCircle2,
                        width: 18.h,
                        height: 18.h,
                      ),
                      SizedBox(
                        height: 59.h,
                        child: VerticalDivider(
                          thickness: 2.h,
                          color: selectMenu.value == 2 ? AppColors.colorFFAC88EF : AppColors.colorBABABA,
                        ),
                      ),
                      Image.asset(
                        selectMenu.value == 3 ?  AppImageAssets.iconExpenseManagementCircle1 : AppImageAssets.iconExpenseManagementCircle2,
                        width: 18.h,
                        height: 18.h,

                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          _onMenuItemTapped(0);
                          selectMenu.value = 0;
                        },
                        child: CustomButtonGradation(
                          text: languageService.translate('basic_setup', locale: locale),
                          left: 26.w,
                          right: 26.w,
                          top: 5.h,
                          bottom: 5.h,
                          backgroundColor1: selectMenu.value == 0 ? AppColors.colorBE93EA : Colors.white ,
                          backgroundColor2: selectMenu.value == 0 ? AppColors.colorA57BF2 : Colors.white,
                          textColor: selectMenu.value == 0 ? Colors.white : AppColors.color3B313D,
                          shadowColor: selectMenu.value == 0 ? AppColors.color804A0849 : AppColors.color12000000,

                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      InkWell(
                        onTap: () {
                          _onMenuItemTapped(1);
                          selectMenu.value = 1;
                        },
                        child: CustomButtonGradation(
                          text: languageService.translate('proxy_setup', locale: locale),
                          backgroundColor1: selectMenu.value == 1 ? AppColors.colorBE93EA : Colors.white ,
                          backgroundColor2: selectMenu.value == 1 ? AppColors.colorA57BF2 : Colors.white,
                          textColor: selectMenu.value == 1 ? Colors.white : AppColors.color3B313D,
                          shadowColor: selectMenu.value == 1 ? AppColors.color804A0849 : AppColors.color12000000,
                          left: 26.w,
                          right: 26.w,
                          top: 5.h,
                          bottom: 5.h,
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      InkWell(
                        onTap: () {
                          _onMenuItemTapped(2);
                          selectMenu.value = 2;
                        },
                        child: CustomButtonGradation(
                        text: languageService.translate('common_settings', locale: locale),
                        backgroundColor1: selectMenu.value == 2 ? AppColors.colorBE93EA : Colors.white ,
                        backgroundColor2: selectMenu.value == 2 ? AppColors.colorA57BF2 : Colors.white,
                          textColor: selectMenu.value == 2 ? Colors.white : AppColors.color3B313D,
                          shadowColor: selectMenu.value == 2 ? AppColors.color804A0849 : AppColors.color12000000,
                        left: 26.w,
                        right: 26.w,
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      InkWell(
                        onTap: () {
                          _onMenuItemTapped(3);
                          selectMenu.value = 3;
                        },
                        child: CustomButtonGradation(
                          text: languageService.translate('fingerprint_setting', locale: locale),
                          backgroundColor1: selectMenu.value == 3 ? AppColors.colorBE93EA : Colors.white ,
                          backgroundColor2: selectMenu.value == 3 ? AppColors.colorA57BF2 : Colors.white,
                          textColor: selectMenu.value == 3 ? Colors.white : AppColors.color3B313D,
                          shadowColor: selectMenu.value == 3 ? AppColors.color804A0849 : AppColors.color12000000,
                          left: 26.w,
                          right: 26.w,
                          top: 5.h,
                          bottom: 5.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 17.w,
          ),
          Expanded(
            child: CustomContainStyle(
              padding: EdgeInsets.fromLTRB(
                  19.w, 17.h, 33.w, 16.h),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ExpenseManageStyle1(),
                    SizedBox(height: 20.h,),
                    const ExpenseManagementStyle2(),
                    SizedBox(height: 20.h,),
                    ExpenseManagementStyle3(),
                    SizedBox(height: 20.h,),
                    buildConfiguration.value ? ExpenseManagementStyle5() :  ExpenseManagementStyle4(),

                    SizedBox(height: 117.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              buildConfiguration.value = true;
                            },
                            child: CustomButtonGradation(
                                text: languageService.translate('generate_fingerprint_configuration', locale: locale),
                                left: 56.w,
                                right: 56.w,
                                top: 17.h,
                                bottom: 17.h,
                                shadowColor: AppColors.color804A0849),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                        HookConsumer(
                          builder: (context, ref, child) {
                            return  InkWell(
                              onTap: () {
                                ref.read(expenseManageProvider.notifier).setExpenseManage(false);
                              },
                              child: CustomButton(
                                  text: languageService.translate('cancel', locale: locale),
                                  backgroundColor: AppColors.colorB5A4D7,
                                  horizontal: 56.w,
                                  vertical: 17.h,
                                  textColor: Colors.white,
                                  boxShadow:  const [ BoxShadow(
                                    color: AppColors.color804A0849,
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // changes position of shadow
                                  )]

                              ),
                            );
                          },
                        ) ,
                          SizedBox(
                            width: 15.w,
                          ),
                          InkWell(
                            onTap: () {
                              buildConfiguration.value = false;
                            },
                            child: CustomButtonGradation(
                                text: languageService.translate('sure', locale: locale),
                                left: 56.w,
                                right: 56.w,
                                top: 17.h,
                                bottom: 17.h,
                                shadowColor: AppColors.color804A0849
                            ),
                          ),
                        ],
                    ),
                    SizedBox(height: 30.h,),
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
  void _onMenuItemTapped(int index) {
    scrollController.animateTo(
      scrollPositions[index],
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
