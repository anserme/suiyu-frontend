import 'package:flutter/foundation.dart' show immutable;
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:riverpod/riverpod.dart';

import '../../../resources/lations/languages.dart';

@immutable
class SetMealBean {
  const SetMealBean({
    required this.icon,
    required this.title,
    required this.setMealBeanItem,
    required this.serviceItem,
  });

  final String icon;
  final String title;
  final SetMealBeanItem setMealBeanItem;
  final List<String> serviceItem;
}

@immutable
class  SetMealBeanItem{
  const SetMealBeanItem( {
  required this.totalAmount,
  required this.use,
    required this.authorized
});

final int totalAmount;
final int use;
final int authorized;
}

class SetMealList extends Notifier<List<SetMealBean>> {
  SetMealBeanItem mSetMealBeanItem = SetMealBeanItem(totalAmount: 10, use: 10, authorized: 10);
  SetMealBeanItem mSetMealBeanItem2 = SetMealBeanItem(totalAmount: 10, use: 10, authorized: 0);
  SetMealBeanItem mSetMealBeanItem3 = SetMealBeanItem(totalAmount: 10, use: 0, authorized: 0);

  List<String> serviceItem = ["去开通"];
  List<String> serviceItem2 = ["操作指南(图文)", "操作指南(视频)", "常见问题", "打开"];

  @override
  List<SetMealBean> build() => [
    SetMealBean( icon: AppImageAssets.homeWindow, title: "窗口环境", setMealBeanItem: mSetMealBeanItem, serviceItem: serviceItem),
    SetMealBean( icon: AppImageAssets.homeEmployee, title: "员工", setMealBeanItem: mSetMealBeanItem2, serviceItem: serviceItem),
    SetMealBean( icon: AppImageAssets.homeGroupControlSystemItem, title: "群控系统", setMealBeanItem: mSetMealBeanItem3, serviceItem: serviceItem2),

  ];

  final languageService = LanguageService();
   LanguageService language() {
     return languageService;
   }
}
