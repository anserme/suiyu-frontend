import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/app_dimens/app_dimens.dart';
import 'package:fpbrowser/resources/components/cumstom_text_style.dart';
import 'package:fpbrowser/resources/components/custom_button_gradation.dart';
import 'package:fpbrowser/resources/components/custome_contain_style.dart';

import '../../../resources/app_colors/app_dark_colors.dart';
import '../../../resources/components/custome_contain_gradation_style.dart';
import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';
import '../../../resources/theme/provider/theme_provider.dart';

///
/// 推广奖励
///

class PromotionIncentivePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = ref.watch(languageProvider).languageCode;
    final bool themeDark = ref.watch(themeNotifier);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        17.w,
        20.h,
        23.w,
        19.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomContainGradationStyle(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.fromLTRB(32.w, 24.h,
                      27.w, 24.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextStyle(
                              text: languageService.translate("your_promotional_link", locale: locale), textSize: 20.sp),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomTextStyle(
                            text: languageService.translate("open_package_tip", locale: locale),
                          ),
                        ],
                      ),
                      CustomButtonGradation(
                        text: languageService.translate("liberal", locale: locale),
                        left: 16.w,
                        right: 16.w,
                        top: 8.h,
                        bottom: 8.h
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomContainGradationStyle(
                  margin: EdgeInsets.only(left: 8.w),
                  padding: EdgeInsets.fromLTRB(
                      19.w, 18.h, 0, 18.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(text: languageService.translate("your_invitation_code", locale: locale), textSize: 20.sp),
                      SizedBox(
                        height: 6.h,
                      ),
                      CustomButtonGradation(
                        text: languageService.translate("show_after_becoming_promoter", locale: locale),
                        left: 20.w,
                        right: 16.h,
                        top: 8.h,
                        bottom: 8.h
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: CustomContainStyle(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 21.w, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 4.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.h),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          CustomTextStyle(
                            text: languageService.translate("data_overview", locale: locale),
                            textColor: themeDark ? AppDarkColors.color6429D1: AppColors.color6429D1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomButtonGradation(
                            text: languageService.translate("view_coupons", locale: locale),
                            left: 15.w,
                            right: 13.w,
                            top: 5.h,
                            bottom: 5.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomButtonGradation(
                            text: languageService.translate("withdraw", locale: locale),
                            left: 14.w,
                            right: 14.w,
                            top: 5.h,
                            bottom: 5.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomButtonGradation(
                            text: languageService.translate("promotion_details", locale: locale),
                            left: 15.w,
                            right: 15.w,
                            top: 5.h,
                            bottom: 5.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomButtonGradation(
                            text: languageService.translate("withdrawal_record", locale: locale),
                            left: 15.w,
                            right: 15.w,
                            top: 5.h,
                            bottom: 5.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Row(
                    children: [
                      dataStatistics(
                        106.w,
                       41.h,
                        AppImageAssets.promotionIncentiveUserBg,
                        languageService.translate("number_invited_users", locale: locale),
                        0,
                      ),
                      dataStatistics(
                        90.w,
                       41.h,
                        AppImageAssets.promotionIncentiveMoneyBg,
                        languageService.translate("cumulative_share_amount", locale: locale),
                        0,
                      ),
                      dataStatistics(
                        96.w,
                        35.h,
                        AppImageAssets.promotionIncentiveWithdrawBg,
                        languageService.translate("cumulative_withdrawal", locale: locale),
                        0,
                      ),
                      dataStatistics(
                        98.w,
                        42.h,
                        AppImageAssets.promotionIncentivePurseBg,
                        languageService.translate("can_withdraw", locale: locale),
                        0,
                      ),
                    ],
                  ),
                  notify(
                      44.w,
                      44.h,
                      AppImageAssets.promotionIncentiveNotifyBg,
                      31.h,
                      "比特浏览器邀请奖励机制上线啦！重金奖励出击!",
                      "通过邀请奖励机制，您不仅可以将比特浏览器推荐给有需求的人，同时可以为自己带来丰厚的分成回报!"),
                  SizedBox(
                    height: 29.h,
                  ),
                  Expanded(
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
                            languageService.translate("promotion_incentive_mechanism", locale: locale),
                            style: TextStyle(
                                fontSize: 18.sp, color: Colors.white),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            left: 41.w,
                            top: 19.h,
                            bottom: 57.h,
                          ),
                          decoration: BoxDecoration(
                              color:  AppColors.colorD9FFFFF,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.w),
                                  bottomRight: Radius.circular(5.w),),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ]
                          ),
                          child: CustomTextStyle(
                            text:
                            "1.针对所有比特浏览器付费用户开放! \n 2.复制【您的推广链接】，使用您擅长的方式推广，通过您的推广链接注册用户并消费，您可以获得消费金额的高比例分成。\n 3.推广奖励: 用户浏览器套餐消费金额的 20%分成，手机环境套餐消费金额的 10%分成! (永久被动收入，不限定期限) \n 4.可提现金额需要大于 200元 ，同时至少5 个邀请用户购买过套餐，即可申请提现。\n 5.如在奖励期内您的用户取消订阅或产生退款，对应的邀请奖励也随即取消。\n6.不得以任何不正当手段/舞弊行为参与本活动，如存在违规行为，官方将冻结全部奖励并追究法律责任。\n 7.本活动最终解释权归主办方所有，如有疑问请联系客服!",
                            textSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 四个背景图片样式
  Widget dataStatistics(double paddingLeft, double paddingTop, String picPath,
      String title, int number) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: paddingLeft, top: paddingTop),
        constraints: BoxConstraints.expand(
          height: 126.h,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(picPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextStyle(text: title),
            SizedBox(
              height: 6.h,
            ),
            CustomTextStyle(text: "$number")
          ],
        ),
      ),
    );
  }

  Widget notify(double paddingLeft, double paddingTop, String picPath,
      double paddingBottom, String title, String content) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          left: paddingLeft, top: paddingTop, bottom: paddingBottom),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(picPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextStyle(
            text: title,
            textSize: 24.sp,
          ),
          SizedBox(
            height: 19.h,
          ),
          CustomTextStyle(
            text: content,
            textSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
