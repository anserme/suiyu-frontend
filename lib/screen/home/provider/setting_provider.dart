import 'package:flutter/foundation.dart' show immutable;
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:riverpod/riverpod.dart';

import '../../../resources/lations/languages.dart';

@immutable
class SettingSelectTab {
  const SettingSelectTab( {
    required this.name,
    required this.id,
    required this.isSelect,
  });

  final String name;
  final int id;
  final bool isSelect;
}

class SettingSelectTabList extends Notifier<List<SettingSelectTab>> {

  @override
  List<SettingSelectTab> build() => [
    const SettingSelectTab(name: "基础设置", id: 0, isSelect: true),
    const SettingSelectTab(name: "创建窗口模版(常用设置)", id: 1, isSelect: false),
    const SettingSelectTab(name: "创建窗口模版(指纹设置)", id: 2, isSelect: false),
    const SettingSelectTab(name: "全局动态管理", id: 3, isSelect: false),
    const SettingSelectTab(name: "导入Chrome书签", id: 4, isSelect: false),
    const SettingSelectTab(name: "Local API", id: 5, isSelect: false),
    const SettingSelectTab(name: "全局设置", id: 6, isSelect: false),
  ];

  void selectItem({required int  id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          SettingSelectTab(
              id: menu.id,
              name: menu.name,
              isSelect: !menu.isSelect,
          )
        else
          SettingSelectTab(
            id: menu.id,
            name: menu.name,
            isSelect: false,
          )
    ];
  }

  final languageService = LanguageService();
   LanguageService language() {
     return languageService;
   }
}
