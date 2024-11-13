import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/app_assets/app_image_assets.dart';
import '../../../resources/app_colors/app_colors.dart';
import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/app_dimens/app_dimens.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_contain_select.dart';
import '../../../resources/components/custom_list_bottom.dart';
import '../../../resources/components/custome_contain_style.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';
import '../provider/employee_management_provider.dart';

///
/// 费用中心
///
class ExpenseCenterPage extends HookConsumerWidget {
  const ExpenseCenterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectWindowGroup = useState(true);
    final employeeManagementContentListProvider = NotifierProvider<
        EmployeeManagementContentList,
        List<EmployeeManagementContent>>(EmployeeManagementContentList.new);
    String locale = ref.watch(languageProvider).languageCode;

    final bool themeDark = ref.watch(themeNotifier);

    return Padding(
      padding: EdgeInsets.fromLTRB(15.w, 20.h, 25.w, 9.h),
      child: CustomContainStyle(
        padding: EdgeInsets.fromLTRB(
          0,
          12.h,
          0,
          18.h,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 26.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ContainSelectSwitch(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2.h),
                          bottomLeft: Radius.circular(2.h),
                        ),
                        text: languageService.translate('window_billing',
                            locale: locale),
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
                          selectWindowGroup.value = !selectWindowGroup.value;
                        },
                        width: 84.w,
                      ),
                      ContainSelectSwitch(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(2.h),
                          bottomRight: Radius.circular(2.h),
                        ),
                        text: languageService.translate(
                            'cloud_mobile_phone_bill',
                            locale: locale),
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
                        width: 88.w,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CustomButtonGradation(
                        text: languageService.translate("online_recharge",
                            locale: locale),
                        left: 22.w,
                        right: 18.w,
                        top: 9.h,
                        bottom: 9.h,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      CustomButton(
                        text: languageService.translate('view_coupons',
                            locale: locale),
                        horizontal: 13.w,
                        vertical: 9.h,
                        textColor: Colors.white,
                        backgroundColor: AppColors.colorE6913D,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.color308814CA,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9.h,
            ),

            ///  4张图片
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                homeFourPic(
                    AppImageAssets.expenseCenterBalanceBg,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          languageService.translate("balance", locale: locale),
                          style: TextStyle(
                              color: AppColors.color101216, fontSize: 14.sp),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              color: AppColors.color101216,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    330.w,
                    85.w,
                    41.h,
                    185),
                homeFourPic(
                    AppImageAssets.expenseCenterBillMonthlyBg,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          languageService.translate("billing_monthly_fee",
                              locale: locale),
                          style: TextStyle(
                              color: AppColors.color101216, fontSize: 14.sp),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: languageService.translate(
                                    'billing_monthly_fee_tip',
                                    locale: locale),
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: AppColors.color101216,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: languageService.translate(
                                    'billing_monthly_fee_tip2',
                                    locale: locale),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.color101216),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    400.w,
                    24.w,
                    24.h,
                    247),
                homeFourPic(
                  AppImageAssets.expenseCenterBillingDetailsBg,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageService.translate("billing_details",
                            locale: locale),
                        style: TextStyle(
                            color: AppColors.color101216, fontSize: 14.sp),
                      ),
                      Text(
                        languageService.translate("billing_details_tip",
                            locale: locale),
                        style: TextStyle(
                            color: AppColors.color101216, fontSize: 14.sp),
                      ),
                      Text(
                        languageService.translate("billing_details_tip1",
                            locale: locale),
                        style: TextStyle(
                            color: AppColors.color101216, fontSize: 14.sp),
                      ),
                    ],
                  ),
                  400.w,
                  24.w,
                  24.h,
                  247,
                ),
                homeFourPic(
                    AppImageAssets.expenseCenterAccessStatisticsBg,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          languageService.translate("access_statistics",
                              locale: locale),
                          style: TextStyle(
                              color: AppColors.color101216, fontSize: 14.sp),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: languageService.translate(
                                    'open_times_today',
                                    locale: locale),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.color101216),
                              ),
                              TextSpan(
                                text: languageService.translate(
                                    'open_times_today_tip',
                                    locale: locale),
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    color: AppColors.color101216,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          languageService.translate("open_times_today_tip1",
                              locale: locale),
                          style: TextStyle(
                              color: AppColors.color101216, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    509.w,
                    24.w,
                    24.h,
                    314,),
              ],
            ),
            _groupManagementTitle(locale),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 18.w),
                child: HookConsumer(builder: (context, ref, child) {
                  var todos = ref.watch(employeeManagementContentListProvider);

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
                          ref
                              .read(employeeManagementContentListProvider
                                  .notifier)
                              .editOut(id: index);
                        },
                        onHover: (PointerEvent details) {
                          // ref.read(employeeManagementContentListProvider.notifier).editHover(id: index);
                        },
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(employeeManagementContentListProvider
                                    .notifier)
                                .editSelect(id: index);
                          },
                          child:
                              _employeeManagementContent(todos[index], index),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            CustomListBottom()
          ],
        ),
      ),
    );
  }

  Widget _groupManagementTitle(String locale) {
    return Container(
      height: 48.h,
      margin: EdgeInsets.only(left: 10.w, right: 18.w),
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
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              languageService.translate('time', locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 192.w,
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              languageService.translate('transaction_amount', locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 268.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              languageService.translate('account_balance2', locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 420.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              languageService.translate('payment_method', locale: locale),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.color101216,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 243.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              languageService.translate('order_type', locale: locale),
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
              languageService.translate('transaction_details', locale: locale),
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
        border: Border(
          top: BorderSide.none, // 不显示上边框
          right: BorderSide.none, // 不显示右边框
          left: BorderSide.none, // 不显示左边框
          bottom: BorderSide(
              color: content.isHover || content.isEnter
                  ? AppColors.color612CD9
                  : Colors.transparent, // 下边框颜色
              width: 2.w // 下边框宽度
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
            width: 192.w,
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
            width: 268.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              content.mobilePhoneEnvironmentNumber,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 420.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              content.identity,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 243.w,
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              content.time,
              style: TextStyle(
                fontSize: 14.sp,
                color: content.isSelect ? Colors.white : AppColors.color101216,
              ),
            ),
          ),
          Container(
            width: 218.w,
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              content.time,
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

  /// 四张图片
  Widget homeFourPic(String picPath, Widget child, double width,
      double paddingLeft, double paddingTop, flex) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 126.h,
        padding: EdgeInsets.only(left: paddingLeft, top: paddingTop),
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
