import 'package:flutter/foundation.dart' show immutable;
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:riverpod/riverpod.dart';

import '../../../resources/lations/languages.dart';

@immutable
class ExpenseManageSelect {
  const ExpenseManageSelect( {
    required this.name,
    required this.id,
    required this.isSelect,
  });

  final String name;
  final int id;
  final bool isSelect;
}

class ExpenseManageSelectList extends Notifier<List<ExpenseManageSelect>> {

  @override
  List<ExpenseManageSelect> build() => [
    const ExpenseManageSelect(name: "128", id: 0, isSelect: true),
    const ExpenseManageSelect(name: "126", id: 1, isSelect: false),
    const ExpenseManageSelect(name: "124", id: 2, isSelect: false),
    const ExpenseManageSelect(name: "122", id: 3, isSelect: false),
    const ExpenseManageSelect(name: "118", id: 4, isSelect: false),
    const ExpenseManageSelect(name: "112", id: 5, isSelect: false),
    const ExpenseManageSelect(name: "104", id: 6, isSelect: false),
  ];

  void selectItem({required int  id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          ExpenseManageSelect(
              id: menu.id,
              name: menu.name,
              isSelect: !menu.isSelect,
          )
        else
          ExpenseManageSelect(
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

@immutable
class ExpenseManageDeviceSelect {
  const ExpenseManageDeviceSelect( {
    required this.name,
    required this.id,
    required this.isSelect,
  });

  final String name;
  final int id;
  final bool isSelect;
}

class ExpenseManageDeviceSelectList extends Notifier<List<ExpenseManageDeviceSelect>> {

  @override
  List<ExpenseManageDeviceSelect> build() =>
      [
        const ExpenseManageDeviceSelect(name: "PC端", id: 0, isSelect: true),
        const ExpenseManageDeviceSelect(name: "安卓", id: 1, isSelect: false),
        const ExpenseManageDeviceSelect(name: "IOS", id: 2, isSelect: false),
      ];

  void selectItem({required int id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          ExpenseManageDeviceSelect(
            id: menu.id,
            name: menu.name,
            isSelect: !menu.isSelect,
          )
        else
          ExpenseManageDeviceSelect(
            id: menu.id,
            name: menu.name,
            isSelect: false,
          )
    ];
  }
}

@immutable
class ExpenseManageRTCSelect {
  const ExpenseManageRTCSelect( {
    required this.name,
    required this.id,
    required this.isSelect,
  });

  final String name;
  final int id;
  final bool isSelect;
}

class ExpenseManageRTCSelectList extends Notifier<List<ExpenseManageRTCSelect>> {

  @override
  List<ExpenseManageRTCSelect> build() =>
      [
        const ExpenseManageRTCSelect(name: "替换", id: 0, isSelect: true),
        const ExpenseManageRTCSelect(name: "隐私", id: 1, isSelect: false),
        const ExpenseManageRTCSelect(name: "允许", id: 2, isSelect: false),
        const ExpenseManageRTCSelect(name: "禁止", id: 3, isSelect: false),
      ];

  void selectItem({required int id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          ExpenseManageRTCSelect(
            id: menu.id,
            name: menu.name,
            isSelect: !menu.isSelect,
          )
        else
          ExpenseManageRTCSelect(
            id: menu.id,
            name: menu.name,
            isSelect: false,
          )
    ];
  }
}