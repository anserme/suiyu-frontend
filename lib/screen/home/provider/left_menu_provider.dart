import 'package:flutter/foundation.dart' show immutable;
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:riverpod/riverpod.dart';

import '../../../resources/lations/languages.dart';
import '../../../resources/lations/provider/language_notifier.dart';

@immutable
class LeftMenu {
  const LeftMenu({
    required this.icon,
    required this.itemName,
    required this.id,
    required this.iconSelect,
    this.isSelect = false,
  });

  final String icon;
  final String itemName;
  final bool isSelect;
  final int id;
  final String iconSelect;

  @override
  String toString() {
    return 'LeftMenu(description: $itemName, isSelect: $isSelect)';
  }

  String setItemNameLocale(String locale) {
    if (id == 0) {
      return languageService.translate('home', locale: locale);
    } else if (id == 1) {
      return languageService.translate('browser_window', locale: locale);
    }else if (id == 2) {
      return languageService.translate('cloud_mobile_environment', locale: locale);
    }else if (id == 3) {
      return languageService.translate('automate', locale: locale);
    }else if (id == 4) {
      return languageService.translate('group_management', locale: locale);
    }else if (id == 5) {
      return languageService.translate('agency_ip', locale: locale);
    }else if (id == 6) {
      return languageService.translate('expansion_center', locale: locale);
    }else if (id == 7) {
      return languageService.translate('employee_management', locale: locale);
    }else if (id == 8) {
      return languageService.translate('promotion_incentive', locale: locale);
    }else if (id == 9) {
      return languageService.translate('expense_center', locale: locale);
    }else if (id == 10) {
      return languageService.translate('setting', locale: locale);
    }else if (id == 11) {
      return languageService.translate('operation_log', locale: locale);
    } else{
      return languageService.translate('user_help', locale: locale);
    }
  }

}

class LeftMenuList extends Notifier<List<LeftMenu>> {
  @override
  List<LeftMenu> build() => [
     LeftMenu(id: 0, icon: AppImageAssets.iconHome, itemName: languageService.translate('home'), isSelect: true, iconSelect: AppImageAssets.iconHomeSelect),
     LeftMenu(id: 1, icon: AppImageAssets.homeBrowserWindow, itemName: languageService.translate('browser_window'), iconSelect: AppImageAssets.homeBrowserWindowSelect),
     LeftMenu(id: 2, icon: AppImageAssets.homeCloudMobileEnvironment, itemName: languageService.translate('cloud_mobile_environment'), iconSelect: AppImageAssets.homeCloudMobileEnvironment),
     LeftMenu(id: 3, icon: AppImageAssets.homeAutomate, itemName: languageService.translate('automate'), iconSelect: AppImageAssets.homeAutomate),
     LeftMenu(id: 4, icon: AppImageAssets.homeGroupManagement, itemName: languageService.translate('group_management'), iconSelect: AppImageAssets.homeGroupManagementSelect),
     LeftMenu(id: 5, icon: AppImageAssets.homeAgencyIp, itemName: languageService.translate('agency_ip'), iconSelect: AppImageAssets.homeAgencyIp),
     LeftMenu(id: 6, icon: AppImageAssets.homeExpansionCenter, itemName: languageService.translate('expansion_center'), iconSelect: AppImageAssets.homeExpansionCenter),
     LeftMenu(id: 7, icon: AppImageAssets.homeEmployeeManagement, itemName: languageService.translate('employee_management'), iconSelect: AppImageAssets.homeEmployeeManagementSelect),
     LeftMenu(id: 8, icon: AppImageAssets.homePromotionIncentive, itemName: languageService.translate('promotion_incentive'), iconSelect: AppImageAssets.homePromotionIncentiveSelect),
     LeftMenu(id: 9, icon: AppImageAssets.homeExpenseCenter, itemName: languageService.translate('expense_center'), iconSelect: AppImageAssets.homeExpenseCenterSelect),
     LeftMenu(id: 10, icon: AppImageAssets.homeSetting, itemName: languageService.translate('setting'), iconSelect: AppImageAssets.homeSettingSelect),
     LeftMenu(id: 11, icon: AppImageAssets.homeOperationLog, itemName: languageService.translate('operation_log'), iconSelect: AppImageAssets.homeOperationLogSelect),
     LeftMenu(id: 12, icon: AppImageAssets.homeUserHelp, itemName: languageService.translate('user_help'), iconSelect: AppImageAssets.homeUserHelp),
  ];

  void edit({required int id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          LeftMenu(
            icon: menu.icon,
            itemName: menu.itemName,
            id: menu.id,
            isSelect: !menu.isSelect,
            iconSelect: menu.iconSelect
          )
        else
          LeftMenu(
              icon: menu.icon,
              itemName: menu.itemName,
              id: menu.id,
              isSelect: false,
              iconSelect: menu.iconSelect
          )
    ];
  }
  
}
